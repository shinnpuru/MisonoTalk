# MoeTalk

### 地址

http://talk.shinnpuru.site

### 配置

打开左侧菜单，选择模型设置，配置模型api
```
名称       该配置项的名称，自定
base url   api的base_url，模型文档会提供
api key    api密钥
model      使用的模型名
temperature 生成文本的温度，0-1之间，越大生成的文本越随机
repetition_penalty 生成文本的重复惩罚，0-1之间，越大生成的文本越不重复
presence_penalty 生成文本的存在惩罚，0-1之间，越大生成的文本越不重复
max_tokens 生成文本的最大长度，比如16384
```
保存后确定即可

### 导入
在设置页点击恢复会默认从设备的下载目录导入备份文件，兼容SillyTavern格式的json。

### 备份
在设置页点击备份会默认导出备份文件到设备的下载目录，备份中文件除了保存的对话外还有api密钥等敏感信息，请勿轻易分享到公开平台

### AI绘画
使用[diffusecraft](https://r3gm-diffusecraft.hf.space/)作为api，你需要Duplicate this Space，获取自己的hf space url

### AI语音
使用[vits-models](https://shinnpuru-vits-models.hf.space)作为api，你需要Duplicate this Space，获取自己的hf space url

### 开发

```shell
flutter pub get
flutter run
```

### 部署

```shell
flutter build web
docker build -t MoeTalk .
docker run -d -p 80:80 MoeTalk
```