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

2. [配置 ssh 和 vim] 打开虚拟机, 在桌面右键打开 `终端`, 输入:

   ```bash
   sudo apt install openssh-server vim -y
   ```

3. [获取虚拟机 ip] 在 `终端` 内输入:

   ```bash
   hostname -I
   ```

4. [配置 Windows Terminal] 在 Microsoft Store 内安装 `Windows Terminal`, 也可以使用其他 ssh 客户端

   在 `设置` 选项卡中点击左下角 `打开 JSON 文件`, 在 "profiles" -> "list" 中添加如下内容:

   ```json
            {
                "commandline": "ssh usr@192.168.1.123",
                "guid": "{1caa0dad-35be-5f56-a8ff-afceeeaa6121}",
                "hidden": false,
                "icon": "ms-appx:///ProfileIcons/{9acb9455-ca41-5af7-950f-6bca1bc9722f}.png",
                "name": "Ubuntu22b"
            },
   ```

   将 "commandline" 中 `usr` 换成 Ubuntu 系统用户名, `192.168.1.123` 换成虚拟机 ip
   
   将 "guid" 替换成新生成 guid, [生成地址](https://www.iamwawa.cn/guid.html)

   连接时提示 "Are you sure you want to continue connecting (yes/no/[fingerprint])?" 输入 `yes`

## owncloud server 部署

0. 默认用户名为 `root`, 默认密码为 `zzccchen1234`, 在下面 `.bash` 配置文件中搜索修改

1. 使用 ssh 连接至 Ubuntu 系统, 可以使用 `wget` 下载 `.bash` 配置文件:
   
   ```bash
   wget https://github.com/zzccchen/owncloud_on_LAN/blob/main/owncloud_server10.bash
   ```

   或 本地创建 `.bash` 配置文件, 并复制粘贴 `.bash` 配置文件内容

2. 授予 `.bash` 配置文件可执行权限, 并执行:
   
   ```bash
   sudo chmod +x owncloud.bash
   sudo bash ./owncloud.bash
   ```

## owncloud Infinite Scale 部署
