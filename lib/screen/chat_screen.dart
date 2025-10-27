import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/login_provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();

  void _sendMessage(){
    final user =context.read<LoginProvider>().user;
    if (user != null && _controller.text.isNotEmpty){
      FirebaseFirestore.instance.collection('chats').add({
        'text': _controller.text,
        'sender': user.email,
        'timestamp':FieldValue.serverTimestamp(),
      });
      _controller.clear();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('chat'),
          actions: [IconButton(onPressed: () async {
            await context.read<LoginProvider>().signOut();
            Navigator.pushNamed(context, 'login');
          }, icon: Icon(Icons.logout),)]
        ),
      body: Column(
        children: [
          //텍스트 출력창
          Expanded(child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('chats')
                .orderBy('timestamp', descending: true)
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator(),
                );
              }
              final chatDocs = snapshot.data.docs;
              return ListView.builder(
                  itemCount: chatDocs.length,
                  itemBuilder: (context, index){
                return Text(chatDocs[index]['text']);
              });
            },
          )),
          //텍스트 입력창
          Padding(padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                  child: TextField(
                    controller: _controller,
                decoration: InputDecoration(labelText: 'Send a message..'),
              )),
              IconButton(onPressed: _sendMessage, icon: Icon(Icons.send))
            ],
          ),
          )
        ],
      ),
    );
  }
}
