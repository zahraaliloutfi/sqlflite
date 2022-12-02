import 'package:sqlflite/helper/litedb.dart';
import '../models/person.dart';

class DbHelper extends LiteDb {
//get all persons from data base
  getAllPersons() async{
  //list of int :يعني بتاخد ارقام لغايه ال سايز بتاع ال اينت
  // list of person :يعني بتاخد بس ال متغيرات ال فيه ال بيرسون
  List<Person> persons = [];
//هاتلي كل القيم ال في جدول البرسون
  String sql = "SELECT * FROM PERSON";
  List<Map> myMap =await inquiry(sql);
  for(int i =0;i<myMap.length;i++){
    //person.fromMap == دا ال هضيفه جوا ال ليست
    //why my map.length == عشان دا طول ال دابيز ال مينفعش اخرج عنه
    persons.add(Person.fromMap(myMap[i]));
  }
return persons;
}
//insert
  //انا عاوزه استخدم الميثودس ال جوا ال لايت دي بي ال انا عاملاه فهوا محتاج سكوال فهعمل كل مره ال سكوال و انادي علي الفانكشن انسيرت او علي حسب انا عاوزه ايه و ابعته فيها
insertNewPerson(Person person) async{
    String sql = '''
    INSERT INTO Person(name, age) 
    VALUES('${person.name}',${person.age})
    ''';
    //بحط اويت قبل الميثود ال هرجع بيها ال هعمل ريترن بيها
int result =await insert(sql);
return result;
}

}
/*
// Insert some records in a transaction
await database.transaction((txn) async {
  int id1 = await txn.rawInsert(
      'INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)');
  print('inserted1: $id1');
  int id2 = await txn.rawInsert(
      'INSERT INTO Test(name, value, num) VALUES(?, ?, ?)',
      ['another name', 12345678, 3.1416]);
  print('inserted2: $id2');
});

 */