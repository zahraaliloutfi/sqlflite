


class Person {

  int id;
  String name;
  int age;
  double salary;

  Person({required this.id, required this.name, required this.age, this.salary = 0.0});

  factory Person.getNewEmpty() {
    return Person(
        id: 0,
        name: '',
        age: 0
    );
  }

  factory Person.fromMap(Map<dynamic, dynamic> map) {
    return Person(
        id: map['id'] ?? 0,
        name: map['name'] ?? '',
        age: map['age'] ?? 0,
        salary: map['salary']?.toDouble() ?? 0.0
    );
  }
}
// //المودل دا هوا علاقه التطبيق ب الداتابيز
// //كل لما يبقي عندك جدول في الداتابيز لازم تعمله مودل يجتوي علي نفس المتغيرات ال موجوده في الجدول دا
// //لما بنرجع من الداتابيز بنرجه ليست اوف ماب
//
// class Person {
//   //شلت الفاينل ال قبلهم عشان اتحكم في القيمه بتاعتهم
//    int id;
//    String name;
//    int age;
//
//   Person({required this.id, required this.name, required this.age});
//
//   factory Person.getNewEmpty() {
//     return Person(id: 0, name: '', age: 0);
//   }
// //Method returns constructor or an object i think named :fromMap
//   factory Person.fromMap(Map<dynamic, dynamic> map) {
//     return Person(
//       //لو ب نل بترجع قيمه افتراضيه صفر او مساحه فاضيه
//         id: map['id'] ?? 0, name: map['name'] ?? '', age: map['age'] ?? 0);
//   }
// }
