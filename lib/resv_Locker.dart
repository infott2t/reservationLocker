class ResevLocker {
  int? id;
  int? lockerId; // Locker의 id
  int? customerId; // Customer의 id
  DateTime? startDate; // 예약 시작 날짜
  DateTime? endDate; // 예약 종료 날짜

  ResevLocker({
    this.id,
    this.lockerId,
    this.customerId,
    this.startDate,
    this.endDate,
  });
}

List<ResevLocker> initDummydataResevLocker() {
  List<ResevLocker> result = [];

  return result;
}
