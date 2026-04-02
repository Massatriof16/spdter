
if ! dpkg -l termux-api libusb clang git pkg-config  glib pango libcairo gdk-pixbuf at-spi2-core xorgproto xorg-util-macros make cmake  &>/dev/null; then
    # Jika paket belum terinstal, jalankan perintah instalasi
    echo " Beberapa Package belum terinstall! "
    echo " "
    echo "Memulai Instalasi..."
    echo " "
    sleep 1
    apt update
    apt upgrade
    pkg install termux-api libusb clang git pkg-config glib pango libcairo gdk-pixbuf at-spi2-core xorgproto xorg-util-macros make cmake -y

sleep 3
  fi

 if [ ! -e spd_dump ]; then
 echo "Membuat File untuk pertama kali"
 git clone https://github.com/TomKing062/spreadtrum_flash
 cd spreadtrum_flash
 make
 chmod a+x spd_dump
 cd ..
 cp -r spreadtrum_flash/spd_dump $(pwd)
 cp -r spreadtrum_flash/Lib $(pwd)
 rm -rf spreadtrum_flash
 echo "file telah dibuat"
 fi
 
 echo ""
 echo " Memulai eksekusi..."
 echo ""



chmod a+x *
echo " Check file yang terkonek....."
termux-usb -l > file.txt
# Ambil path USB dari file.txt dengan grep dan sed
USB_DEVICE=$(grep -o '/dev/bus/usb/[0-9]*/[0-9]*' file.txt)

# Jalankan perintah termux-usb dengan perangkat yang ditemukan
echo " Meminta izin eksekusi..."
termux-usb -r "$USB_DEVICE"

echo "Menjalankan spd_dump..."
termux-usb -e './spd_dump --usb-fd' "$USB_DEVICE"