#!/bin/bash

# فایل شامل آدرس‌ها و اطلاعات دسترسی به سرورها
servers_file="sv.txt"

# خواندن هر خط از فایل
while IFS=: read -r ip user password; do
    # ایجاد یک دستور SSH که از passwordless SSH استفاده می‌کند
    sshpass -p "$password" ssh -o StrictHostKeyChecking=no "$user@$ip" \
    "curl -Ls https://raw.githubusercontent.com/iERROR0098/Cloud-init/main/run.sh | dos2unix | bash"
done < "$servers_file"
