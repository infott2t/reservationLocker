import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:locker_1/customer.dart';
import 'package:locker_1/main_page.dart';
import 'package:locker_1/resv_Locker.dart';
import 'package:provider/provider.dart';

import 'my_app_state.dart';

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
                              builder: (context) => const EntrancePage()),
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

class EntrancePage extends StatefulWidget {
  const EntrancePage({super.key});

  @override
  State<EntrancePage> createState() => _EntrancePageState();
}

class _EntrancePageState extends State<EntrancePage> {
  Customer? customer;
  bool? viewChk;
  List<ResevLocker>? resevLockerList;
  @override
  initState() {
    super.initState();
    var appState = context.read<MyAppState>();
    customer = appState.loginCustomer;
    viewChk = false;
    resevLockerList = appState.getResevList();
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    customer = appState.loginCustomer;
    resevLockerList = appState.getResevList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('사물함 예약 시스템'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 10, 0),
              child: Text('로그인했습니다. ${customer!.name}님'),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainPage2()),
                  );
                },
                child: const Text('예약하기')),
            ElevatedButton(
              onPressed: () {
                viewChk = !viewChk!;
                resevLockerList = appState.getResevList();

                setState(() {});
              },
              child: const Text('예약조회'),
            ),
            Visibility(
              visible: viewChk!,
              child: Container(
                child: const Column(
                  children: [
                    Text('예약 조회입니다.'),
                  ],
                ),
              ),
            ),
            Visibility(
                visible: viewChk!,
                child: Expanded(child: ResvText(resevLockerList)))
          ],
        ),
      ),
    );
  }
}

class ResvText extends StatelessWidget {
  List<ResevLocker>? resevLockerList;
  ResvText(
    this.resevLockerList, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('예약 상태'),
              Text('사물함 번호'),
              Text('예약 시작일'),
              Text('예약 종료일'),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: resevLockerList?.length ?? 0,
            itemBuilder: (context, index) {
              final resevLocker = resevLockerList![index];
              final startDate = resevLocker.startDate != null
                  ? DateFormat('yy-MM-dd HH:mm').format(resevLocker.startDate!)
                  : '데이터 없음';
              final endDate = resevLocker.endDate != null
                  ? DateFormat('yy-MM-dd HH:mm').format(resevLocker.endDate!)
                  : "예약 중";

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(resevLocker.endDate != null ? '예약 종료' : '예약 중'),
                    Text('${resevLocker.lockerId}번'),
                    Text(startDate),
                    Text(endDate),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
