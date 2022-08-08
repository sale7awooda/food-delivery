import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteHelperClass {
  // Check the DB is Initialised or not and do it if not

  Database? _db;
  String dbName= 'DataBase.db';
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initiateDataBase();
      return _db;
    } else {
      return _db;
    }
  }
  //Initialise the DB

  initiateDataBase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, dbName);
    Database myDB = await openDatabase(path,
        onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
    return myDB;
  }

// performed when the DB version is upgraded

  _onUpgrade(Database db, int oldversion, int newversion) async{

    await db.execute("ALTAR TABLE tableOne ADD COLUMN color TEXT");
  }

// performed when the DB is Created

  _onCreate(Database db, int version) async {
    //add tables one by one 
    await db.execute('''
    CREATE TABLE "tableOne" (
      "id" INTEGER NOT NULL PRIMERY KEY AUTOINCREMENT ,
      "note" TEXT NOT NULL ,
      "details" TEXT NOT NULL
    )''');
    await db.execute('''
    CREATE TABLE "tableTwo" (
      "id" INTEGER NOT NULL PRIMERY KEY AUTOINCREMENT ,
      "note" TEXT NOT NULL ,
      "details" TEXT NOT NULL
    )''');

    // add table by batch


    // Batch batch= db.batch();
    //  batch.execute('''
    // CREATE TABLE "tableOne" (
    //   "id" INTEGER NOT NULL PRIMERY KEY AUTOINCREMENT ,
    //   "note" TEXT NOT NULL ,
    //   "details" TEXT NOT NULL
    // )''');
    //  batch.execute('''
    // CREATE TABLE "tableTwo" (
    //   "id" INTEGER NOT NULL PRIMERY KEY AUTOINCREMENT ,
    //   "note" TEXT NOT NULL ,
    //   "details" TEXT NOT NULL
    // )''');

    // await batch.commit();


  }

  readDataRAW(String sql) async {
    Database? myDB = await db;
    List<Map> response = await myDB!.rawQuery(sql);
    return response;
  }

  insertDataRAW(String sql) async {
    Database? myDB = await db;
    int response = await myDB!.rawInsert(sql);
    return response;
  }

  updateDataRAW(String sql) async {
    Database? myDB = await db;
    int response = await myDB!.rawUpdate(sql);
    return response;
  }

  deleteDataRAW(String sql) async {
    Database? myDB = await db;
    int response = await myDB!.rawDelete(sql);
    return response;
  }

readData(String table, String? groupBy, String where) async {
    Database? myDB = await db;
    List<Map> response = await myDB!.query(table,groupBy: groupBy,where: where,);
    return response;
  }

  insertData(String table,Map<String, Object?> values) async {
    Database? myDB = await db;
    int response = await myDB!.insert(table, values);
    return response;
  }

  updateData(String table,Map<String, Object?> values, String where) async {
    Database? myDB = await db;
    int response = await myDB!.update(table, values,where: where);
    return response;
  }

  deleteData(String table, String? where) async {
    Database? myDB = await db;
    int response = await myDB!.delete(table , where: where);
    return response;
  }

  // delete the DataBAse

  deleteDB ()async{
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, dbName);
    await deleteDatabase(path);
  }
}
