# owncloud

owncloud server (v10.12.1) / Infinite Scale (v3.0.0) 在局域网 (LAN) 下单服务器部署教程.

Owncloud server version (v10.12.1) / Infinite Scale version (v3.0.0) single server deployment tutorial in local area network (LAN).

## 前提说明

系统为 Ubuntu 22.04.2 LTS 裸机, 运行在 VMware Workstation 17.0.2 Pro 上

使用物理机部署时可以跳过 虚拟机配置 步骤

### 虚拟机配置

1. 在虚拟机关机情况下, 选中虚拟机, 点击 `编辑虚拟机设置`, 点击 `网络适配器`, 勾选 `启动时连接`、`桥接模式` 和 `复制物理网络连接状态`, 保存设置

2. 点击 VMware Workstation 软件菜单栏的 `编辑`, 点击 `虚拟网络编辑器`, 使用管理员权限点击弹出窗口右下角 `更改设置`,

   选中 `VMnet0`, 选择 `桥接模式`, 并将 `已桥接至` 改成所使用的物理网卡

### 系统初始化

1. [更新系统] 打开虚拟机, 在桌面右键打开 `终端`, 输入:

   ```bash
   sudo apt update
   sudo apt upgrade -y
   ```

   建议更新完后重启虚拟机

2. [配置 SSH] 

3. [配置 Windows Terminal] 

## owncloud server 部署

script to install owncloud on ubuntu 22.04
download the script:
wget https://raw.githubusercontent.com/linuxsyr/owncloud/main/owncloud.bash
chmod +x owncloud.bash 
sudo bash ./owncloud.bash
you are done

## owncloud Infinite Scale 部署
