# MisonoTalk

### 这是什么
 [Bilibili](https://www.bilibili.com/video/BV1YBvXenEZK)

### 下载
 [Github Release](https://github.com/k96e/MisonoTalk/releases)

### 使用
#### 配置
 点击右上角×， 选择Settings，配置模型api
 ```
 名称       该配置项的名称，自定
 base url   api的base_url，模型文档会提供
 api key    api密钥
 model      使用的模型名
 ```
 保存后确定即可

#### 关于备份
 在设置页点击备份会默认导出备份文件到设备的下载目录，备份中文件除了保存的对话外还有api密钥等敏感信息，请勿轻易分享到公开平台

### 叠甲
- 自用项目能跑就行，代码很烂
- 未花的设定基于个人偏好肯定有失偏颇，想要修改提示词可以直接覆盖`assets/prompt.txt`
- 没有对提示词攻击做任何防范，钓鱼铁上钩
- 本地部署版暂时没做联网搜索和事实核查能力，涉及游戏设定和具体剧情的内容是肯定会瞎编的
- 不可以色色

项目中引用的所有图片版权归属Nexon

### 开发

```shell
flutter pub get
flutter run
```

### 部署

```shell
flutter build web
docker build -t misonotalk .
docker run -d -p 80:80 misonotalk
```