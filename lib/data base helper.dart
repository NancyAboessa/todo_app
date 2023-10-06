
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper
{
  static const _databaseName = "MyDatabase.db";
  static const _databaseVersion = 1;

  static const table = 'my_table';

  static const columnId = '_id';
  static const columnName = 'todo';

  static late Database? _database;

 // DbHelper.PrivateConstructor();
static final DbHelper instance =DbHelper();
//  static final DbHelper instance =DbHelper.PrivateConstructor() ;
   Future <Database?> get database async{

     if(_database != null) {
       await initDatabase();
       return database;
     }
   }

  Future<void> initDatabase() async {
    final  documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
     _database = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );


  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnName TEXT NOT NULL
          )
          ''');
  }

  Future<int?> insert(Map<String, dynamic> todo) async {
     Database? db = await instance?.database;
    return await db?.insert(table, todo);
  }

  Future<List<Map<String, dynamic>>?> queryAllTodos() async {
    Database? db = await instance?.database;
    return await db?.query(table);
  }

  Future<int?> delete(int id) async {
    Database? db = await instance?.database;
    return await db?.delete(
      table,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}




