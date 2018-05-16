HW_6 自动化部署
==================================

## **实验完成度**

- [x] FTP服务器自动部署
- [x] NFS服务器自动部署
- [x] SAMBA服务器自动部署

## 实验过程

### 1.FTP服务器自动部署

#### 1.实验环境：Ubuntu 14.04

![](https://raw.githubusercontent.com/CUCCS/2015-linux-public-Geraens/HW_6_1/ftp_1.png)

#### 2.脚本内的配置文件修改

![](https://raw.githubusercontent.com/CUCCS/2015-linux-public-Geraens/HW_6_1/ftp_2.png)

#### 3.启动脚本

![](https://raw.githubusercontent.com/CUCCS/2015-linux-public-Geraens/HW_6_1/ftp_3.png)

#### 4.访问服务器

![](https://raw.githubusercontent.com/CUCCS/2015-linux-public-Geraens/HW_6_1/ftp_4.png)

![](https://raw.githubusercontent.com/CUCCS/2015-linux-public-Geraens/HW_6_1/ftp_5.png)

![](https://raw.githubusercontent.com/CUCCS/2015-linux-public-Geraens/HW_6_1/ftp_6.png)

#### 脚本文件        [autoFTP.sh](https://github.com/CUCCS/2015-linux-public-Geraens/blob/HW_6_1/autoFtp.txt)

### 2.NFS服务器自动部署

#### 实验环境： Ubuntu 14.04

#### 1.启动脚本

![](https://raw.githubusercontent.com/CUCCS/2015-linux-public-Geraens/HW_6_1/NFS_1.png)

#### 2.在另一台虚拟机中访问共享文件

![](https://raw.githubusercontent.com/CUCCS/2015-linux-public-Geraens/HW_6_1/NFS_2.png)

#### 脚本文件：  [autoNFS.sh](https://github.com/CUCCS/2015-linux-public-Geraens/blob/HW_6_1/autoNFS.txt)


### 3.SAMBA服务器自动部署

#### 实验环境： Ubuntu 14.04

#### 1.启动脚本

![](https://raw.githubusercontent.com/CUCCS/2015-linux-public-Geraens/HW_6_1/samba_2.png)

#### 2.在另一台虚拟机查看是否开启了服务

![](https://raw.githubusercontent.com/CUCCS/2015-linux-public-Geraens/HW_6_1/samba_1.png)

#### 脚本文件：  [autosamba.sh](https://github.com/CUCCS/2015-linux-public-Geraens/blob/HW_6_1/autosamba.txt)

## 参考资料

### [Ubuntu下使用vsftpd配置FTP服务器](https://blog.csdn.net/cloume/article/details/49720361)

### [Ubuntu14.04 nfs服务器搭建](https://blog.csdn.net/u010346967/article/details/46384641)
