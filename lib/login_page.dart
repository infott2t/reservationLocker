import 'package:flutter/material.dart';
import 'package:locker_1/main_page.dart';
import 'package:provider/provider.dart';

import 'my_app_state.dart';

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    '사물함 예약 시스템',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Expanded(
                flex: 4,
                child: Text(
                  '(Git, https://github.com/infott2t/reservationLocker)',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Expanded(
                flex: 1,
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email 입력',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Container(
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    child: const Text('들어가기'),
                    onPressed: () {
                      // Here you can handle the press event.
                      print('Email: ${emailController.text}');
                      bool chk =
                          appState.checkCustomerEmail(emailController.text);
                      if (chk) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainPage()),
                        );
                      } else {}
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
