import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(
              flex: 1,
            ),
            Image.asset('assets/illustrations/login.png'),
            Spacer(
              flex: 3,
            ),
            const Text(
              'Welcome To Amir Hosein Chat App',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              // child: ,
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
