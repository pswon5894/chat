import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/login_provider.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LoginProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
        title: Text('suceess page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: '로그인 성공! ${user?.email}'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {
                  await Provider.of<LoginProvider>(context, listen: false).signOut();
                  Navigator.pushNamed(context, '/login');
                },
                child: Text('로그아웃')),
          ],
        ),
      ),
    );
  }
}