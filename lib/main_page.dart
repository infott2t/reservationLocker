import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:locker_1/customer.dart';
import 'package:locker_1/locker.dart';
import 'package:locker_1/my_app_state.dart';
import 'package:provider/provider.dart';

class MainPage2 extends StatefulWidget {
  const MainPage2({super.key});

  @override
  State<MainPage2> createState() => _MainPage2State();
}

class _MainPage2State extends State<MainPage2> {
  Customer? loginCustomer;
  String? gender;
  Locker? startLocker; //사물함 시작번호
  DateTime? revDateTime; //예약일

  String formatDate(DateTime dateTime) {
    var formatter = DateFormat('yy년 MM월 dd일');
    if (dateTime == null) return '';
    return formatter.format(dateTime);
  }

  @override
  void initState() {
    super.initState();
    var appState = context.read<MyAppState>();
    loginCustomer = appState.loginCustomer;
    gender = appState.loginCustomer?.gender;

    //사물함 번호를 바꾼다. 시작번호를 가져온다.
    startLocker = appState.lockerList?.reduce((current, next) =>
        current.lockerNumber! < next.lockerNumber! ? current : next);

    //예약일은 오늘로 설정.
    revDateTime = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('사물함 예약 시스템'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 10, 0),
            child: Text('로그인했습니다. ${loginCustomer!.name}님 환영합니다.'),
          ),
          // Expanded 끝
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    '${gender != null ? gender == 'man' ? '남자' : '여자' : '---'} 사물함'),
                const SizedBox(width: 30),
                const Text('예약가능'),
                const Icon(
                  Icons.square,
                  color: Colors.green,
                  size: 17,
                ),
                const Text('40'),
                const SizedBox(
                  width: 3,
                ),
                const Text('| 사용중'),
                const Icon(Icons.square, color: Colors.blue, size: 17),
                const Text('10'),
                const SizedBox(
                  width: 2,
                ),
                const Text('| 보수중'),
                const Icon(Icons.square, color: Colors.red, size: 17),
                const Text('0'),
              ],
            ),
          ),

          Container(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('내가 예약한 사물함: -- '),
                const SizedBox(width: 10),
                Text('예약일: ${formatDate(revDateTime!)} (오늘)'),
                const SizedBox(width: 20),
              ],
            ),
          ),
          Expanded(
            // Expanded 시작
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: GridView.count(
                crossAxisCount: 5, // 가로 개수를 5로 변경
                children: List.generate(25, (index) {
                  // 총 개수를 유지
                  Color color;
                  color = appState.getLockerColors(index);

                  return GestureDetector(
                    onTap: () {
                      if (startLocker?.lockerNumber != null) {
                        print(
                            'Locker Num: ${startLocker!.lockerNumber! + index}');
                      } else {
                        print('Locker Num: ${index + 1}');
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: color,
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: color,
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '${startLocker?.lockerNumber != null ? (startLocker!.lockerNumber! - 1 + index) + 1 : index + 1}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Customer? loginCustomer;
  @override
  void initState() {
    super.initState();
    var appState = context.read<MyAppState>();
    loginCustomer = appState.loginCustomer;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('사물함 예약 시스템'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('로그인했습니다. ${loginCustomer!.name}님 환영합니다.'),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.count(
                crossAxisCount: 5,
                children: List.generate(25, (index) {
                  return GestureDetector(
                    onTap: () {
                      print('Locker Number: ${index + 1}');
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Center(
                              child: Text((index + 1).toString(),
                                  style: const TextStyle(fontSize: 20)))),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
