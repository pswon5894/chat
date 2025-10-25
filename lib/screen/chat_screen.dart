import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/login_provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('chat'),
        actions: [
          IconButton(onPressed: () async {
            await context.read<LoginProvider>().signOut;
            Navigator.pushNamed(context, '/login');
          }, icon: Icon(Icons.logout))
        ],
      )
    );
  }
}
