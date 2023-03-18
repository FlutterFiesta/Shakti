import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:power_she_pre/constants.dart';
import '../../components/AppBarHome.dart';
import '../../components/BottomBar.dart';
import '../../components/EndDrawer.dart';
import 'package:power_she_pre/screens/ChatBotSupport/messageScreen.dart';

class mainChatScreen extends StatefulWidget {
  static const String id = "mainchat_screen";
  const mainChatScreen({Key? key}) : super(key: key);

  @override
  State<mainChatScreen> createState() => _mainChatScreenState();
}

class _mainChatScreenState extends State<mainChatScreen> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarHome(heading: 'Chat Support'),
        endDrawer: EndDrawer(),
        body: Container(
          child: Column(
            children: [
              Expanded(child: MessagesScreen(messages: messages)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                color: kpink,
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      controller: _controller,
                      style: TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Type your message...",
                          hintStyle:
                              TextStyle(color: Colors.white, fontSize: 16)),
                    )),
                    IconButton(
                      onPressed: () {
                        sendMessage(_controller.text);
                        _controller.clear();
                      },
                      icon: Icon(Icons.send),
                      color: Colors.white,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      if (response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }
}
