HW_5  Web服务器
=====================

## **实验概述**

### 由于没有能够在同一台虚拟机内布置nginx和verynginx，所以在两台虚拟机完成实验

## **实验环境**

### wordpress与dvwa :ubuntu 16.04

> HostOnly网卡IP：192.168.56.101



### verynginx ： ubuntu 16.04

> HostOnly网卡IP：192.168.56.102

## **实验过程**

### 1.配置wordpress

![](https://raw.githubusercontent.com/CUCCS/2015-linux-public-Geraens/HW_5/1.png)

![](https://raw.githubusercontent.com/CUCCS/2015-linux-public-Geraens/HW_5/3.png)

### 2.设置wordpress对外访问地址

![](https://raw.githubusercontent.com/CUCCS/2015-linux-public-Geraens/HW_5/4.png)

### 3.配置dvwa

![](https://raw.githubusercontent.com/CUCCS/2015-linux-public-Geraens/HW_5/13.png)

### 4.设置dvwa对外访问地址

![](https://raw.githubusercontent.com/CUCCS/2015-linux-public-Geraens/HW_5/9.png)

### 5.安装verynginx

![](https://raw.githubusercontent.com/CUCCS/2015-linux-public-Geraens/HW_5/5.png)

### verynginx进行反向代理并禁止IP访问，设置白名单

![](https://raw.githubusercontent.com/CUCCS/2015-linux-public-Geraens/HW_5/7.png)

![](https://raw.githubusercontent.com/CUCCS/2015-linux-public-Geraens/HW_5/8.png)


## **完成情况**

- [x] 正确配置wordpress

- [x] 正确配置dvwa

- [x] verynginx进行反向代理

- [x] 设置对外访问地址

- [x] 设置白名单禁止访问

- [x] 禁止直接通过IP访问

- [ ] 配置https

- [ ] 热恢复

- [ ] 配置verynginx，实现SQL注入在低安全等级进行防护

## **实验问题**

### 1.配置的两个站点Firefox和chrome都可以正常访问，IE显示无法访问

### 2.
