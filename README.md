# TS3AudioBot_docker

## 简介
这是一个可以帮助你使用 Docker 或者 Podman 简单部署 TeamSpeak 3 服务器网易云音乐机器人的仓库。使用 Docker Compose 保证超无脑，在本地运行机器人+API。支持 linux arm64 和 linux amd64 平台。

十分感谢：

- [TS3AudioBot](https://github.com/Splamy/TS3AudioBot) 音乐机器人
- [TS3AudioBot_docker](https://github.com/getdrunkonmovies-com/TS3AudioBot_docker) 原 docker 项目
- [TS3AudioBot-NetEaseCloudmusic-plugin](https://github.com/ZHANGTIANYAO1/TS3AudioBot-NetEaseCloudmusic-plugin) 音乐机器人插件

## 使用方法
首先克隆这个项目到本地，确保有安装 Docker 和 Docker Compose：
（当然用 Podman + podman-compose 也是可行的）

```shell
git clone https://github.com/appe233/TS3AudioBot_docker.git
cd TS3AudioBot_docker
```

接下来你需要编辑一下 bot.toml 这个文件。主要是要填写 [connect] 一栏的几项。

```toml
[connect]
#The server password. Leave empty for none. 这一项是服务器密码，如果没有设置密码的话留空。
server_password = { pw = "" }
#The default channel password. Leave empty for none.
channel_password = {  }
#Overrides the displayed version for the ts3 client. Leave empty for default.
client_version = {  }
#The address, ip or nickname (and port; default: 9987) of the TeamSpeak3 server 服务器地址或者别名。
address = ""
#Examples: "Home/Lobby", "/5", "Home/Afk \\/ Not Here". 机器人启动后会自动加入服务器的频道，如果留空则会加入服务器的默认频道。
channel = ""
#The client badges. You can set a comma separated string with max three GUID's. Here is a list: http://yat.qa/ressourcen/abzeichen-badges/
badges = ""
#Client nickname when connecting. 机器人的名字
name = "音乐机器人"
```

如果你想，也可以编辑一下 YunSettings.yml 这个文件。这是网易云音乐插件的配置文件。以下是这个文件的默认状态。

```yaml
# 在给别人分享该文件时,请保证 Cookie 为空!
version: 1
playMode: SeqPlay
neteaseApi: http://musicapi:3000
isPrivateFMMode: false
isQrlogin: false
cookieUpdateIntervalMin: 30
autoPause: true
Header:
  Cookie:
  User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36 Edg/122.0.0.0

```

正式启动服务：

```shell
docker compose up -d
```

接下来等待镜像部署完毕，就可以使用机器人了。回到频道内，输入以下命令加载插件，然后就可以愉快的使用机器人了。

```
!plugin load 0
```

## 一些帮助

如果你的 TeamSpeak 服务器刚好部署在这台服务器上，并且你在使用 Podman 的话，在生成TS3AudioBot配置时要你填写的TS服务器的地址可以写`host.containers.internal`，这将会指向本机。（需要 5.3.0 及以上的 Podman ）

欢迎给各种建议！有什么问题可以发到 issues 里面。