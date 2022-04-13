# Expand LVM in vmware by extending the disk

## Expand the partition

* run sudo fdisk /dev/sda
* use p to list the partitions. Make note of the start cylinder of /dev/sda1
* use d to delete first the swap partition (2) and then the /dev/sda1 partition. This is very scary but is actually harmless as the data is not written to the disk until you write the changes to the disk. 
* use n to create a new primary partition. Make sure its start cylinder is exactly the same as the old /dev/sda1 used to have. For the end cylinder agree with the default choice, which is to make the partition to span the whole disk.
* use a to toggle the bootable flag on the new /dev/sda1
* review your changes, make a deep breath and use w to write the new partition table to disk. You'll get a message telling that the kernel couldn't re-read the partition table because the device is busy, but that's ok.
* Reboot with sudo reboot. When the system boots, you'll have a smaller filesystem living inside a larger partition. 
* The next magic command is resize2fs. Run sudo resize2fs /dev/sda1 - this form will default to making the filesystem to take all available space on the partition. 

## Expanding the LVM

### Physical volume

pvresize /dev/sda3

  Physical volume "/dev/sda3" changed

  1 physical volume(s) resized or updated / 0 physical volume(s) not resized

### Volume Group

// doesn’t apply in this situation

### Logical Volume

lvextend -r -l+100%FREE /dev/ubuntu-vg/ubuntu-lv

### Filesystem

Only applies if you forget the -r

Expand LVM in vmware by adding a disk 