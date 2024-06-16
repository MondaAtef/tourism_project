import 'dart:io';
import 'dart:typed_data';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:image_picker/image_picker.dart';

const String GEMINI_API_KEY = 'AIzaSyATicaAafi-vz0hgnOkp_U132hG_6Y3yaw';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final Gemini gemini = Gemini.instance;

  ChatUser currentUser = ChatUser(
    id: '0',
    firstName: 'Ebtihal',
  );

  ChatUser geminiUser = ChatUser(
    id: '1',
    firstName: 'VIXOR',
    profileImage:
'https://th.bing.com/th/id/OIP.W9wvIK6EBcuAuUFMObyUMAHaFj?rs=1&pid=ImgDetMain'  );

  List<ChatMessage> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: DashChat(
        inputOptions: InputOptions(
          autocorrect: true,
          alwaysShowSend: true,
          sendButtonBuilder: (send) {
            return IconButton(
              onPressed: send,
              icon: Icon(Icons.arrow_back),
            );
          },
          cursorStyle: const CursorStyle(
            color: Colors.black,
          ),
        ),
        currentUser: currentUser,
        onSend: _sendMessage,
        messages: messages,
      ),
    );
  }

  void _sendMessage(ChatMessage message) {
    setState(() {
      messages = [message, ...messages];
    });
    try {
      String question = message.text;

      List<Uint8List>? images;
      if (message.medias?.isNotEmpty ?? false) {
        images = [
          File(message.medias!.first.url).readAsBytesSync(),
        ];
      }
      gemini
          .streamGenerateContent(
        question,
        images: images,
      )
          .listen((event) {
        ChatMessage? lastMessage = messages.firstOrNull;

        if (lastMessage != null && lastMessage.user == geminiUser) {
          lastMessage = messages.removeAt(0);

          String response = event.content?.parts?.fold(
              '', (previous, current) => '$previous ${current.text}') ??
              '';
          lastMessage.text += response;
          setState(() {
            messages = [lastMessage!, ...messages];
          });
        } else {
          String response = event.content?.parts?.fold(
              '', (previous, current) => '$previous ${current.text}') ??
              '';

          ChatMessage message = ChatMessage(
            user: geminiUser,
            text: response,
            createdAt: DateTime.now(),
          );
          setState(() {
            messages = [message, ...messages];
          });
        }
      });
    } catch (e) {
      debugPrint('my error is $e');
    }
  }

  void _sendMediaMessage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      ChatMessage message = ChatMessage(
        user: currentUser,
        text: 'Describe this picture ?',
        medias: [
          ChatMedia(
            fileName: '',
            type: MediaType.image,
            url: file.path,
          ),
        ],
        createdAt: DateTime.now(),
      );
      _sendMessage(message);
    }
  }
}