#!/bin/bash
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi
mkdir -p /usr/src/linuwu_sense-1.0
cp src/linuwu_sense.c /usr/src/linuwu_sense-1.0/
cat << 'MAKE' > /usr/src/linuwu_sense-1.0/Makefile
obj-m := linuwu_sense.o
all:
	$(MAKE) -C /lib/modules/$(KERNELRELEASE)/build M=$(PWD) modules
clean:
	$(MAKE) -C /lib/modules/$(KERNELRELEASE)/build M=$(PWD) clean
MAKE
cp dkms.conf /usr/src/linuwu_sense-1.0/
dkms add -m linuwu_sense -v 1.0 || true
dkms build -m linuwu_sense -v 1.0
dkms install -m linuwu_sense -v 1.0
echo "DKMS installation complete."
