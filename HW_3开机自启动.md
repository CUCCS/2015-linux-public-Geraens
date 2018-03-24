HW-3 开机自启动
=======================================

## 1.命令

### 1.系统管理

-[systemctl](https://asciinema.org/a/R1UdiWTgD1tprDAZQXFGZsgC2)

-[systemd-analyze](https://asciinema.org/a/os4HBkxtpY58O0RRofp9WmmXT)

-[hostnamectl](https://asciinema.org/a/kcu0JwamphNQIGryL93S9swIE)

-[localectl](https://asciinema.org/a/Twgx4C35mwtd1ew1ptmvBbJxK)

-[timedatectl](https://asciinema.org/a/P4lJDQdIBDh1HjRCWW2xUbhEj)

-[loginctl](https://asciinema.org/a/zBjJ3K2HANPVC5HMd3modDXUB)

### 2.Unit

-[systemctl list-units](https://asciinema.org/a/8X2bj7zZRTnYwVB1UCUtfje7g)

-[systemctl status](https://asciinema.org/a/hnKrJAx0GSQ1ZcEWEuUwTBuIo)

-[Unit管理](https://asciinema.org/a/9tHvdxuikCktiMHgsNLZHwz5g)

-[依赖关系](https://asciinema.org/a/dXADq4tAiW6ZQTMitVVbc0zzk)

### 3.[Unit配置文件](https://asciinema.org/a/FkgVZNoTBrgBTGJCm7blnADcZ)

### 4.[Target](https://asciinema.org/a/VmW8F539sXTIakUDcx7NO1cZZ)

### 5.[日志管理](https://asciinema.org/a/2TX3nBgv09M5IJSXwMWGnFhaw)

## 2.自查

### 1.如何实现开机自动挂载Virtualbox的共享目录分区

#### 在/etc/fstab文件中添加 sharing /mnt/share vboxsf defaults 0 0

### 2.基于LVM（逻辑分卷管理）的分区如何实现动态扩容和缩减容量

#### 1.LVM扩容
        ```
        umount  /mnt/  
        mkfs.ext4  /dev/vg1/lv1  
        lvextend  -L 400M  /dev/vg1/lv1  
        resize2fs  /dev/vg1/lv1
        ```

#### 2.LVM缩减
        ```
        umount  /mnt/
        e2fsck -f /dev/vg1/lv1  
        resize2fs  /dev/vg1/lv1  200M  
        mount  /dev/vg1/lv1   /mnt/

### 3.如何通过systemd设置实现一个脚本在任何情况下被杀死之后会立即重新启动？实现杀不死
    - 设置该脚本配置文件
       ```
    [Service]  
    ...  
    Restart:always  
    ...
    ```


