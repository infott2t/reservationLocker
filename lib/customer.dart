class Customer {
  int? id;
  String? email;
  String? name;
  String? gender; //man, woman

  //생성자 데이터 입력이 가능해진다.
  Customer(this.id, this.email, this.name, this.gender);
}

List<Customer> initDummydataCustomer() {
  List<Customer> result = [];
  result.add(Customer(1, 'test1@email.com', 'John', 'man'));
  result.add(Customer(2, 'test2@email.com', 'Mary', 'woman'));
  result.add(Customer(3, 'test3@email.com', 'Enderson', 'man'));
  result.add(Customer(4, 'test4@email.com', 'Becky', 'woman'));
  result.add(Customer(4, 'test4@email.com', 'Helen', 'woman'));

  return result;
}
