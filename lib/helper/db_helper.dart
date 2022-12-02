// import 'package:sqlflite/helper/litedb.dart';
// import '../models/person.dart';
//
// class DbHelper extends LiteDb {
// //get all persons from data base
//   getAllPersons() async {
//     //list of int :يعني بتاخد ارقام لغايه ال سايز بتاع ال اينت
//     // list of person :يعني بتاخد بس ال متغيرات ال فيه ال بيرسون
//     List<Person> persons = [];
// //هاتلي كل القيم ال في جدول البرسون
//     String sql = "SELECT * FROM PERSON";
//     List<Map> myMap = await inquiry(sql);
//     for (int i = 0; i < myMap.length; i++) {
//       //person.fromMap == دا ال هضيفه جوا ال ليست
//       //why my map.length == عشان دا طول ال دابيز ال مينفعش اخرج عنه
//       persons.add(Person.fromMap(myMap[i]));
//     }
//     return persons;
//   }
//
// //insert
//   //انا عاوزه استخدم الميثودس ال جوا ال لايت دي بي ال انا عاملاه فهوا محتاج سكوال فهعمل كل مره ال سكوال و انادي علي الفانكشن انسيرت او علي حسب انا عاوزه ايه و ابعته فيها
//   insertNewPerson(Person person) async {
//     String sql = '''
//     INSERT INTO Person(name, age)
//     VALUES('${person.name}',${person.age})
//     ''';
//     //بحط اويت قبل الميثود ال هرجع بيها ال هعمل ريترن بيها
//     int result = await insert(sql);
//     return result;
//   }
//
// //update
//
//   updatePerson(Person person) async {
//     String sql = '''
//        UPDATE PERSON SET
//        name = '${person.name}',
//        age = ${person.age},
//        WHERE
//        id = ${person.id}
//     ''';
//     int result = await update(sql);
//     return result;
//   }
// //   updatePerson(Person person) async {
// //     String sql = '''
// //    UPDATE PERSON SET
// //    name = '${person.name}',
// //    age = ${person.age}
// //    WHERE
// //    id = ${person.id}'
// //     ''';
// //
// //     //بحط اويت قبل الميثود ال هرجع بيها ال هعمل ريترن بيها
// //     int result = await update(sql);
// //     return result;
// //   }
//
//   //delete
//   deletePerson(Person person) async {
//     String sql = '''
//        DELETE FROM PERSON
//        WHERE
//        id = ${person.id}
//     ''';
//     int result = await update(sql);
//     return result;
//   }
//
//   // deletePerson(Person person) async {
//   //   String sql = '''
//   // DELETE FROM PERSON
//   // WHERE id = ${person.id}
//   //   ''';
//   //
//   //   //بحط اويت قبل الميثود ال هرجع بيها ال هعمل ريترن بيها
//   //   int result = await delete(sql);
//   //   return result;
//   // }
// }
//
//


import '../models/person.dart';
import 'litedb.dart';

class DbHelper extends LiteDb {

  getAllPersons() async {
    List<Person> persons = [];
    String sql = "SELECT * FROM PERSON";
    List<Map> myMap = await inquiry(sql);
    for (int i = 0; i < myMap.length; i ++) {
      persons.add(Person.fromMap(myMap[i]));
    }
    return persons;
  }

  insertNewPerson(Person person) async {
    String sql = '''
       INSERT INTO PERSON(name, age, salary)
       VALUES ( '${person.name}' ,
        ${person.age} ,
         ${person.salary})
    ''';
    int result = await insert(sql);
    return result;
  }

  updatePerson(Person person) async {
    String sql = '''
       UPDATE PERSON SET 
       name = '${person.name}',
       age = ${person.age},
       salary = ${person.salary}
       WHERE 
       id = ${person.id}
    ''';
    int result = await update(sql);
    return result;
  }

  deletePerson(Person person) async {
    String sql = '''
       DELETE FROM PERSON
       WHERE 
       id = ${person.id}
    ''';
    int result = await update(sql);
    return result;
  }
}