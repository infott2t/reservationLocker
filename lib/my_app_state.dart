import 'package:flutter/material.dart';
import 'package:locker_1/customer.dart';
import 'package:locker_1/locker.dart';
import 'package:collection/collection.dart';
import 'package:locker_1/resv_Locker.dart';

class MyAppState extends ChangeNotifier {
  List<Customer>? customerList; //회원정보. findAll.
  List<Locker>? lockerAllList; //사물함정보. findAll.

  List<ResevLocker>? resevLockerList; //사물함 예약정보. findAll.

  List<Locker>? lockerList; //사물함 정보. 남자와 여자.

  late Customer? loginCustomer; //로그인한 회원정보

  //Counts. 사물함의 상태에따라 카운트되는 변수
  int? availableCount;
  int? inUseCount;
  int? underRepairCount;
  int? totalCount;
  int? myLockerNumber;

  //생성자. 초기실행시 데이터가 입력된다.
  MyAppState() {
    customerList = initDummydataCustomer();
    lockerAllList = initDummydataLocker();
    resevLockerList = initDummydataResevLocker();
    availableCount = 0;
    inUseCount = 0;
    underRepairCount = 0;
    totalCount = 0;
    myLockerNumber = 0;
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
      if (lockerList![index].customerId == loginCustomer?.id) {
        myLockerNumber = lockerList![index].lockerNumber;
        result = Colors.purple.shade500;
      }
    }
    return result;
  }

  String? updateLockerStatus(int lockerNumber, String newStatus) {
    // lockerList에서 lockerNumber에 해당하는 사물함을 찾는다
    var locker =
        lockerList?.firstWhere((locker) => locker.lockerNumber == lockerNumber);
    print(locker!.lockerNumber);

    if (locker.status == 'inUse' && locker.customerId == loginCustomer?.id) {
      return '현재 예약한 사물함입니다.';
    }

    if (locker.status == 'available') {
      // 상태를 업데이트한다
      locker.status = newStatus;
      locker.customerId = loginCustomer?.id;
      print(locker.status);
      // 예약 시작일을 업데이트한다
      locker.startDate = DateTime.now();

      ResevLocker newResev = ResevLocker(
        id: resevLockerList?.length,
        lockerId: locker.lockerNumber,
        customerId: loginCustomer?.id,
        startDate: DateTime.now(),
        endDate: null,
      );
      resevLockerList?.add(newResev);
    } else {
      return '예약이 되지 않았습니다. 예약 정보 갱신이 필요합니다.';
    }

    // lockerAllList에서 lockerNumber에 해당하는 사물함을 찾는다
    var allLocker = lockerAllList
        ?.firstWhere((locker0) => locker0.lockerNumber == lockerNumber);
    if (allLocker != null) {
      // 상태를 업데이트한다
      allLocker.status = newStatus;
      allLocker.customerId = loginCustomer?.id;
      // 예약 시작일을 업데이트한다
      allLocker.startDate = DateTime.now();
      //locker
    } else {
      return '예약이 되지 않았습니다. 예약 정보 갱신이 필요합니다.2';
    }

    // 상태가 변경되었음을 알린다
    notifyListeners();

    // 예약 성공 메시지를 반환
    return '예약이 성공적으로 완료되었습니다.';
  }

  void cancelReservation(int lockerNum) {
    // lockerList에서 lockerNumber에 해당하는 사물함을 찾는다
    var locker = lockerList
        ?.firstWhereOrNull((locker) => locker.lockerNumber == lockerNum);

    if (locker != null) {
      // 상태를 업데이트한다
      locker.status = 'available';
      // 예약 시작일을 null로 설정한다
      locker.startDate = null;
      locker.customerId = null;
    }

    // lockerAllList에서 lockerNumber에 해당하는 사물함을 찾는다
    var allLocker = lockerAllList
        ?.lastWhereOrNull((locker) => locker.lockerNumber == lockerNum);
    if (allLocker != null) {
      // 상태를 업데이트한다
      allLocker.status = 'available';
      // 예약 시작일을 null로 설정한다
      allLocker.startDate = null;
      allLocker.customerId = null;
    }

    // ResevLocker 리스트에서 해당 예약 정보를 찾아서 종료 시간을 업데이트한다
    ResevLocker? reservation = resevLockerList?.lastWhereOrNull((reserv) =>
        reserv.lockerId == lockerNum && reserv.customerId == loginCustomer?.id);

    if (reservation != null) {
      DateTime now = DateTime.now();
      reservation.endDate = now;
    }

    // 상태가 변경되었음을 알린다
    notifyListeners();
  }

  List<ResevLocker>? getResevList() {
    List<ResevLocker>? rervList = resevLockerList
        ?.where((resevLocker) => resevLocker.customerId == loginCustomer?.id)
        .toList();
    notifyListeners();
    return rervList;
  }

  int? countLockersByStatus(String s) {
    int? count;
    if (s == 'available') {
      availableCount =
          count = lockerList!.where((locker) => locker.status == s).length;
    } else if (s == 'inUse') {
      inUseCount =
          count = lockerList!.where((locker) => locker.status == s).length;
    } else {
      underRepairCount =
          count = lockerList!.where((locker) => locker.status == s).length;
    }
    return count;
  }

  void updateCount() {
    totalCount = lockerList!.length;
    availableCount = countLockersByStatus('available');
    inUseCount = countLockersByStatus('inUse');
    underRepairCount = countLockersByStatus('underRepair');
    notifyListeners();
  }

  int? getLockerNumberByCustomer() {
    int? lockerNumber;
    if (lockerList != null) {
      lockerNumber = lockerList!
          .lastWhere((locker) =>
              locker.customerId == loginCustomer?.id &&
              locker.status == 'inUse')
          .lockerNumber;
      myLockerNumber = lockerNumber;
    } else {
      myLockerNumber = 0;
    }
    if (lockerNumber == null) {
      myLockerNumber = 0;
      return 0;
    }
    return myLockerNumber;
  }

  void updateMyNumber() {
    int? lockerNumber;
    lockerNumber = lockerList!
        .lastWhere((locker) =>
            locker.customerId == loginCustomer?.id && locker.status == 'inUse')
        .lockerNumber;
    myLockerNumber = lockerNumber;
    notifyListeners();
  }

  void updateCancelMyNumber() {
    myLockerNumber = 0;
    notifyListeners();
  }

  void updateMyNumber2() {
    int? lockerNumber;

    if (lockerList!
            .lastWhereOrNull((locker) =>
                locker.customerId == loginCustomer?.id &&
                locker.status == 'inUse')
            ?.lockerNumber ==
        null) {
      myLockerNumber = 0;
    } else {
      myLockerNumber = lockerList!
          .lastWhereOrNull((locker) =>
              locker.customerId == loginCustomer?.id &&
              locker.status == 'inUse')
          ?.lockerNumber;
    }

    notifyListeners();
  }
}
