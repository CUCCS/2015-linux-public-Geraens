HW_1 无人值守安装ISO
======================================

## 实验目标

### 1.安装Ubuntu虚拟机并用PuTTY登录<完成>

### 2.设置PuTTY免密登录<完成>

### 3.实现无人值守安装ISO的制作<完成80%>

## 实验过程

### 1.安装Ubuntu虚拟机，其中使用两块网卡：

#### 1.Host_Only网卡     

![](https://raw.githubusercontent.com/CUCCS/2015-linux-public-Geraens/HW_1/HW-1%20%E6%97%A0%E4%BA%BA%E5%80%BC%E5%AE%88%E5%AE%89%E8%A3%85ISO/image%20of%20hw-1/3.png)

#### 2.网络地址转换(nat)

![](https://raw.githubusercontent.com/CUCCS/2015-linux-public-Geraens/HW_1/HW-1%20%E6%97%A0%E4%BA%BA%E5%80%BC%E5%AE%88%E5%AE%89%E8%A3%85ISO/image%20of%20hw-1/4.png)

#### 3.安装完成

![](https://raw.githubusercontent.com/CUCCS/2015-linux-public-Geraens/HW_1/HW-1%20%E6%97%A0%E4%BA%BA%E5%80%BC%E5%AE%88%E5%AE%89%E8%A3%85ISO/image%20of%20hw-1/2.png)

### 2.使用PuTTY完成连接并完成免密登陆

#### 1.使用PUTTYGEN产生公私钥，其中，公钥复制到虚机主机（文件名必须是authorized_keys），私钥点击保存后在PuTTY连接界面选择SSH->AUTH输入即可

![](https://raw.githubusercontent.com/CUCCS/2015-linux-public-Geraens/HW_1/HW-1%20%E6%97%A0%E4%BA%BA%E5%80%BC%E5%AE%88%E5%AE%89%E8%A3%85ISO/image%20of%20hw-1/5.png)

#### 2.免密登录成功

![](https://raw.githubusercontent.com/CUCCS/2015-linux-public-Geraens/HW_1/HW-1%20%E6%97%A0%E4%BA%BA%E5%80%BC%E5%AE%88%E5%AE%89%E8%A3%85ISO/image%20of%20hw-1/6.png)

### 3.按照规定步骤完成镜像上传和镜像挂载以及相关文件的修改

#### 1.修改ioslinux/txt.cfg

![](https://raw.githubusercontent.com/CUCCS/2015-linux-public-Geraens/HW_1/HW-1%20%E6%97%A0%E4%BA%BA%E5%80%BC%E5%AE%88%E5%AE%89%E8%A3%85ISO/image%20of%20hw-1/9.png)

#### 2.将preseed文件添加到镜像文件preseed文件夹下（注意命名，preseed文件应命名为ubuntu-server-autoinstall.seed）

![](https://raw.githubusercontent.com/CUCCS/2015-linux-public-Geraens/HW_1/HW-1%20%E6%97%A0%E4%BA%BA%E5%80%BC%E5%AE%88%E5%AE%89%E8%A3%85ISO/image%20of%20hw-1/11.png)

#### 3.更改镜像文件中的md5sum.txt

![](https://raw.githubusercontent.com/CUCCS/2015-linux-public-Geraens/HW_1/HW-1%20%E6%97%A0%E4%BA%BA%E5%80%BC%E5%AE%88%E5%AE%89%E8%A3%85ISO/image%20of%20hw-1/10.png)

#### 4.使用mkisofs重新生成iso文件（未解决）

## 问题及解决方案

### 问题1.虚拟主机安装失败

![](https://raw.githubusercontent.com/CUCCS/2015-linux-public-Geraens/HW_1/HW-1%20%E6%97%A0%E4%BA%BA%E5%80%BC%E5%AE%88%E5%AE%89%E8%A3%85ISO/image%20of%20hw-1/1.png)

#### 原因：buntu-16.04存在的bug：安装中文系统会失败。

#### 解决方法：

##### 1.安装英文系统

##### 2.第一步语言选择英文，其后每步选择中文，也可安装成功

### 问题2.psftp打不开

![](https://raw.githubusercontent.com/CUCCS/2015-linux-public-Geraens/HW_1/HW-1%20%E6%97%A0%E4%BA%BA%E5%80%BC%E5%AE%88%E5%AE%89%E8%A3%85ISO/image%20of%20hw-1/7.png)

#### 描述：psftp打开后会持续半分钟左右黑屏后闪退

#### 解决方法：使用pscp上传文件：

![](https://raw.githubusercontent.com/CUCCS/2015-linux-public-Geraens/HW_1/HW-1%20%E6%97%A0%E4%BA%BA%E5%80%BC%E5%AE%88%E5%AE%89%E8%A3%85ISO/image%20of%20hw-1/8.png)

### 问题3：mkisofs不可用

#### 描述：

##### 1.使用mkisofs命令时会提示未安装

##### 2.安装时提示定位不了包

![](https://raw.githubusercontent.com/CUCCS/2015-linux-public-Geraens/HW_1/HW-1%20%E6%97%A0%E4%BA%BA%E5%80%BC%E5%AE%88%E5%AE%89%E8%A3%85ISO/image%20of%20hw-1/12.png)

##### 3.使用update和upgrade后问题依旧存在

##### 4.更换源后问题依旧得不到解决

##### 5.安装从官网下载的虚拟机iso，虚拟主机的问题依旧存在。

### 问题未得到解决。
