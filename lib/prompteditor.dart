import 'package:flutter/material.dart';
import 'storage.dart';

class PromptEditor extends StatefulWidget {
  const PromptEditor({super.key});

  @override
  PromptEditorState createState() => PromptEditorState();
}

class PromptEditorState extends State<PromptEditor> {
  TextEditingController controller = TextEditingController();
  TextEditingController studentNameController = TextEditingController();
  TextEditingController originMsgController = TextEditingController();
  TextEditingController studentAvatarController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getPrompt().then((String value) {
      controller.text = value;
    });
    getAvatar().then((String value) {
      studentAvatarController.text = value;
    });
    getStudentName().then((String value) {
      studentNameController.text = value;
    });
    getOriginalMsg().then((String value) {
      originMsgController.text = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('角色编辑器'),
        actions: [
          // 初始化
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () async {
              controller.text = await getPrompt(isDefault: true);
              studentNameController.text = await getStudentName(isDefault: true);
              originMsgController.text = await getOriginalMsg(isDefault: true);
              studentAvatarController.text = await getAvatar(isDefault: true);
            },
          ),
          // 另存为
          IconButton(
            icon: const Icon(Icons.save_as),
            onPressed: () async {
              addStudent(
                studentNameController.text,
                studentAvatarController.text,
                originMsgController.text,
                controller.text,
              );
              setPrompt(controller.text);
              setStudentName(studentNameController.text);
              setOriginalMsg(originMsgController.text);
              setAvatar(studentAvatarController.text);
              Navigator.pop(context);
            },
          ),
          // 保存
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              setPrompt(controller.text);
              setStudentName(studentNameController.text);
              setOriginalMsg(originMsgController.text);
              setAvatar(studentAvatarController.text);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body:  Column(
        children: <Widget>[
          const SizedBox(height: 8),
          TextField(
            controller: studentAvatarController,
            decoration: const InputDecoration(
              labelText: '角色头像',
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: studentNameController,
            decoration: const InputDecoration(
              labelText: '角色名',
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: originMsgController,
            decoration: const InputDecoration(
              labelText: '初始对话',
            ),
          ),
          Expanded(child:
          Padding(padding: const EdgeInsets.all(8.0),
            child: 
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  labelText: '提示词',
                ),
                style: const TextStyle(fontSize: 16,fontFamily: "Courier"),
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
              )
            )
          ),
        ],
      ),
    );
  }
}