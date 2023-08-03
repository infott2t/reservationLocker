class Locker {
  int? id;
  int? lockerNumber;
  int? customerId;
  String? gender; //man, woman
  String? status; //available, inUse, underRepair
  DateTime? startDate;
  DateTime? endDate;

  Locker(
    this.id,
    this.lockerNumber,
    this.customerId,
    this.gender,
    this.status,
    this.startDate,
    this.endDate,
  );
}

List<Locker> initDummydataLocker() {
  List<Locker> result = [];
  result.add(Locker(1, 1, 0, 'woman', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(2, 2, 0, 'woman', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(3, 3, 0, 'woman', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(4, 4, 0, 'woman', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(5, 5, 0, 'woman', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(6, 6, 0, 'woman', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(7, 7, 0, 'woman', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(8, 8, 0, 'woman', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(9, 9, 0, 'woman', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(10, 10, 0, 'woman', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(11, 11, 0, 'woman', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(12, 12, 0, 'woman', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(13, 13, 0, 'woman', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(14, 14, 0, 'woman', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(15, 15, 0, 'woman', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(16, 16, 0, 'woman', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(17, 17, 0, 'woman', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(18, 18, 0, 'woman', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(19, 19, 0, 'woman', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(20, 20, 0, 'woman', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(21, 21, 0, 'woman', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(22, 22, 0, 'woman', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(23, 23, 0, 'woman', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(24, 24, 0, 'woman', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(25, 25, 0, 'woman', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));

  result.add(Locker(26, 26, 0, 'man', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(27, 27, 0, 'man', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(28, 28, 0, 'man', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(29, 29, 0, 'man', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(30, 30, 0, 'man', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(31, 31, 0, 'man', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(32, 32, 0, 'man', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(33, 33, 0, 'man', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(34, 34, 0, 'man', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(35, 35, 0, 'man', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(36, 36, 0, 'man', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(37, 37, 0, 'man', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(38, 38, 0, 'man', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(39, 39, 0, 'man', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(40, 40, 0, 'man', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(41, 41, 0, 'man', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(42, 42, 0, 'man', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(43, 43, 0, 'man', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(44, 44, 0, 'man', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(45, 45, 0, 'man', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(46, 46, 0, 'man', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(47, 47, 0, 'man', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(48, 48, 0, 'man', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(49, 49, 0, 'man', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));
  result.add(Locker(50, 50, 0, 'man', 'available', DateTime(1900, 1, 1),
      DateTime(1900, 1, 1)));

  return result;
}
