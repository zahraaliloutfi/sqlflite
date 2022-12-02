// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
//
// class LiteDb {
//   //single tone design pattern
//   static Database? _db;
//
//   Future<Database?> get getInstance async {
//     if (_db == null) {
//       _db = await inistance();
//       return _db;
//     } else {
//       return _db;
//     }
//   }
//
//   inistance() async {
// // Get a location using getDatabasesPath
//     var databasesPath = await getDatabasesPath();
//     //..../..../..../database.db == database.db
//     String path = join(databasesPath, 'lite.db'); //'lite.db' == 'database name'
//
// // open the database
//     Database database = await openDatabase(path, version: 1,
//         onCreate: (Database db, int version) async {
//       // When creating the db, create the table
//       await db.execute(
//           // 'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)'
//           //AUTOINCREMENT == بيزيد لوحده
//           '''
//           CREATE TABLE PERSON (id INTEGER AUTO_INCREMENT PRIMARY KEY, name TEXT NOT NULL, age INTEGER);
//           CREATE TABLE ACCOUNT (id INTEGER AUTO_INCREMENT PRIMARY KEY,PERSON_ID INTEGER NOT NULL,ACCOUNT INTEGER NOT NULL, VALUE REAL);
//               ''');
//       print('database has created ');
//     });
//     print('database connected ');
//     return database;
//   }
//
// //get from database == الاستعلام
//   inquiry(String sqlTxt) async {
//     Database? db =
//         await getInstance; //لو فيه انستانس هيرجعلي انستانس لو لا هيعمل كرييت انستانس
//     //get the records
//     // List<Map> list = await db!.rawQuery('SELECT * FROM PERSON');//هاتلي كل القيم ال في جدول البرسون
//     //انا عاوزه اختار الجدول مش عاوزاه يبقي ثابت لا عاوزه انا ال اختاره
//     List<Map> list = await db!.rawQuery(sqlTxt);
//
//     return list;
//   }
//
// //insert
//   insert(String sqlTxt) async {
//     Database? db =
//         await getInstance; //لو فيه انستانس هيرجعلي انستانس لو لا هيعمل كرييت انستانس
//     // Insert some record
//     int count = await db!.rawInsert(sqlTxt);
//     return count;
//   }
//
// //update
//   update(String sqlTxt) async {
//     Database? db =
//         await getInstance; //لو فيه انستانس هيرجعلي انستانس لو لا هيعمل كرييت انستانس
//     // Update some record
//     //الكونت هو عدد السطور التي تم التحديث عليها
//     int count = await db!.rawUpdate(sqlTxt);
//     //('UPDATE Test SET name = ?, value = ? WHERE name = ?',
//     //   ['updated name', '9876', 'some name'])
//     print('update');
//     return count; //لو رجعلك ب 0 يبقي محصلش تحديث لو رجع ب 1 علي الاقل يبقي حصل تحديث
//     // print('updated: $count');
//   }
//
// //Delete
//   delete(String sqlTxt) async {
//     Database? db =
//         await getInstance; //لو فيه انستانس هيرجعلي انستانس لو لا هيعمل كرييت انستانس
//     // Delete some record
//     int count = await db!.rawDelete(sqlTxt);
//     print('delete');
//     return count;
//   }
// }
// //الجمله دي ثابته عشان دي الداتا بيز و بعدها بقي بشوف انا هختار اعمل ايه
// // Database? db =
// //     await getInstance; //لو فيه انستانس هيرجعلي انستانس لو لا هيعمل كرييت انستانس
// //
//
// /*
// // Get a location using getDatabasesPath
// var databasesPath = await getDatabasesPath();
// String path = join(databasesPath, 'demo.db');
//
// // Delete the database
// await deleteDatabase(path);
//
// // open the database
// Database database = await openDatabase(path, version: 1,
//     onCreate: (Database db, int version) async {
//   // When creating the db, create the table
//   await db.execute(
//       'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
// });
//
// // Insert some records in a transaction
// await database.transaction((txn) async {
//   int id1 = await txn.rawInsert(
//       'INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)');
//   print('inserted1: $id1');
//   int id2 = await txn.rawInsert(
//       'INSERT INTO Test(name, value, num) VALUES(?, ?, ?)',
//       ['another name', 12345678, 3.1416]);
//   print('inserted2: $id2');
// });
//
// // Update some record
// int count = await database.rawUpdate(
//     'UPDATE Test SET name = ?, value = ? WHERE name = ?',
//     ['updated name', '9876', 'some name']);
// print('updated: $count');
//
// // Get the records
// List<Map> list = await database.rawQuery('SELECT * FROM Test');
// List<Map> expectedList = [
//   {'name': 'updated name', 'id': 1, 'value': 9876, 'num': 456.789},
//   {'name': 'another name', 'id': 2, 'value': 12345678, 'num': 3.1416}
// ];
// print(list);
// print(expectedList);
// assert(const DeepCollectionEquality().equals(list, expectedList));
//
// // Count the records
// count = Sqflite
//     .firstIntValue(await database.rawQuery('SELECT COUNT(*) FROM Test'));
// assert(count == 2);
//
// // Delete a record
// count = await database
//     .rawDelete('DELETE FROM Test WHERE name = ?', ['another name']);
// assert(count == 1);
//
// // Close the database
// await database.close();
// * */
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LiteDb {

  static Database? _db;

  Future<Database?> get getInstance async {
    if (_db == null) {
      _db = await instance();
      return _db;
    } else {
      return _db;
    }
  }

  instance() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'lite_sql.db');

    // open the database
    Database database = await openDatabase(path, version: 2,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              '''  
                CREATE TABLE PERSON (id INTEGER  PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, age INTEGER);
                CREATE TABLE ACCOUNT (id INTEGER  PRIMARY KEY AUTOINCREMENT, PERSON_ID INTEGER NOT  NULL, ACCOUNT INTEGER NOT NULL, VALUE REAL);
              ''');
          print('Text Database has been created');
        },
        onUpgrade: (Database db, int oldVersion, int newVersion) async {
          if (newVersion >= 2) {
            await db.execute('''
            ALTER TABLE PERSON ADD COLUMN salary REAL NULL
            ''');
          }
        }
    );
    print(' Database connected');
    return database;
  }

  inquiry(String sqlTxt) async {
    Database? db = await getInstance;
    // Get the records
    List<Map> list = await db!.rawQuery(sqlTxt);
    return list;
  }

  insert(String sqlTxt) async {
    Database? db = await getInstance;
    // Insert some record
    int count = await db!.rawInsert(sqlTxt);
    return count;
  }

  update(String sqlTxt) async {
    Database? db = await getInstance;
    // Update some record
    int count = await db!.rawUpdate(sqlTxt);
    return count;
  }

  delete(String sqlTxt) async {
    Database? db = await getInstance;
    // Delete some record
    int count = await db!.rawDelete(sqlTxt);
    return count;
  }
}