
chmod a+x *
termux-usb -l > file.txt


# Ambil path USB dari file.txt dengan grep dan sed
USB_DEVICE=$(grep -o '/dev/bus/usb/[0-9]*/[0-9]*' file.txt)

# Jalankan perintah termux-usb dengan perangkat yang ditemukan
termux-usb -r "$USB_DEVICE"

termux-usb -e './spd_dump --usb-fd' "$USB_DEVICE"