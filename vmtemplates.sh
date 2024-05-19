# Downloads and imports proxmox vm templates

#!/bin/bash

rm vzdump-qemu-*

wget https://files.chit.sh/vzdump-qemu-100000.vma.zst
qmrestore vzdump-qemu-100000.vma.zst 100000 --storage local

wget https://files.chit.sh/vzdump-qemu-100001.vma.zst
qmrestore vzdump-qemu-100001.vma.zst 100001 --storage local

wget https://files.chit.sh/vzdump-qemu-100002.vma.zst
qmrestore vzdump-qemu-100002.vma.zst 100002 --storage local

wget https://files.chit.sh/vzdump-qemu-110000.vma.zst
qmrestore vzdump-qemu-110000.vma.zst 110000 --storage local

wget https://files.chit.sh/vzdump-qemu-120000.vma.zst
qmrestore vzdump-qemu-120000.vma.zst 120000 --storage local

wget https://files.chit.sh/vzdump-qemu-130000.vma.zst
qmrestore vzdump-qemu-130000.vma.zst 130000 --storage local

wget https://files.chit.sh/vzdump-qemu-140000.vma.zst
qmrestore vzdump-qemu-140000.vma.zst 140000 --storage local

wget https://files.chit.sh/vzdump-qemu-150000.vma.zst
qmrestore vzdump-qemu-150000.vma.zst 150000 --storage local

wget https://files.chit.sh/vzdump-qemu-150001.vma.zst
qmrestore vzdump-qemu-150001.vma.zst 150001 --storage local

wget https://files.chit.sh/vzdump-qemu-150002.vma.zst
qmrestore vzdump-qemu-150002.vma.zst 150002 --storage local

# Remove Files
rm vzdump-qemu-*