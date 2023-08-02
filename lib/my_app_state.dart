import 'package:flutter/material.dart';
import 'package:locker_1/customer.dart';
import 'package:locker_1/locker.dart';

class MyAppState extends ChangeNotifier {
  List<Customer>? customerList; //회원정보. findAll.
  List<Locker>? lockerAllList; //사물함정보. findAll.

  List<Locker>? lockerList; //사물함 정보. 남자와 여자.

  late Customer? loginCustomer; //로그인한 회원정보

  //생성자. 초기실행시 데이터가 입력된다.
  MyAppState() {
    customerList = initDummydataCustomer();
    lockerAllList = initDummydataLocker();
  }

  bool checkCustomerEmail(String text) {
    bool result = false;
    for (Customer c in customerList!) {
      if (c.email == text) {
        result = true;
        loginCustomer = c;
        // 사물함 리스트를 회원정보에 맞추어 저장한다.
        lockerList = lockerAllList
            ?.where((element) => element.gender == loginCustomer?.gender)
            .toList();
        break;
      }
    }
    return result;
  }

  Color getLockerColors(int index) {
    //available, inUse, underRepair
    Color result = Colors.white;
    if (lockerList![index].status == 'available') {
      result = Colors.green.shade500;
    } else if (lockerList![index].status == 'inUse') {
      result = Colors.blue.shade500;
    }
    return result;
  }
}
