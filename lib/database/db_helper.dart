import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';

import '../app/modeules/Home/controller/home_controller.dart';
import '../models/books_model.dart';

class SQLHelper {
  static Future<void> createTables(sql.Database database) async{
    await database.execute("""CREATE TABLE book(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    book_id INTEGER,
    Year TEXT,
    Title TEXT,
    handle TEXT,
    Publisher TEXT,
    ISBN TEXT,
    Pages INTEGER
    )""");
    await database.execute("""CREATE TABLE booksDeleted(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    book_id INTEGER
    )""");

  }



  static Future<sql.Database> db() async{
    return sql.openDatabase("database_name.db",version: 1,onCreate: (sql.Database database, int version)async{
      await createTables(database);
    });
  }
  Future<void> insertBook(int year,String title,String handle,String publisher,String isbn, int pages) async {
    final db = await SQLHelper.db();

    await db.insert(
      'book',
      {
        'isLocallyCreated': 1,
        'book_id': null,
        'Year': year,
        'Title': title,
        'handle': handle,
        'Publisher': publisher,
        'ISBN': isbn,
        'Pages': pages,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  Future<void> updateBook({int? id, String? title, String? handle, String? publisher, String? isbn}) async {
    final db = await SQLHelper.db();

    // Build the where clause dynamically
    String whereClause = '';
    List<dynamic> whereArgs = [];

    if (id != null) {
      whereClause = 'id = ?';
      whereArgs.add(id);
    }

    if (title != null) {
      if (whereClause.isNotEmpty) {
        whereClause += ' OR ';
      }
      whereClause += 'Title = ?';
      whereArgs.add(title);
    }

    // Perform the update
    await db.update(
      'book',
      {
        'handle': handle,
        'Publisher': publisher,
        'ISBN': isbn,
      },
      where: whereClause,
      whereArgs: whereArgs,
    );
  }

  Future<void> insertBooks(BooksLists result) async {
    final db = await SQLHelper.db();
    var printing = await db.insert('book', result.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print(printing);
  }
  Future<void> insertBooksDeleted(int bookId) async {
    final db = await SQLHelper.db();
    Map<String, dynamic> toMap() {
      return {
        'book_id': bookId,
      };
    }
    var printing = await db.insert('booksDeleted', toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print(printing);
  }
  Future<bool> bookExixts(id) async {
    final db = await SQLHelper.db();
    var result = await db.query(
      'book', // Replace with your actual table name
      where: 'id = ? ', // Adjust the column name as necessary
      whereArgs: [id],
    );
    return result.isNotEmpty;
  }
  Future<List<BooksLists>> fetchBooks() async {
    // RxList<TaskListModelLists> taskList = <TaskListModelLists>[].obs;
    // RxList<TaskListModelLists> filteredTaskList = <TaskListModelLists>[].obs;

    print("Fetching tasks...");
    final db = await SQLHelper.db();
    final result = await db.query("book");

    // Print the raw result from the database
    print('Raw result from database: ${result.length} records');

    // Parse the result into a list of TaskListModelLists
    List<BooksLists> tasks =
    result.map((json) => BooksLists.fromMap(json)).toList();

    // Print the parsed tasks
    print('Parsed tasks: ${tasks.length} records');
    return tasks;
  }
  Future<void> deleteBookByIdOrTitle({int? bookId, String? title}) async {
    final db = await SQLHelper.db(); // Assumes you have a reference to your database

    // Build the where clause dynamically
    String whereClause = '';
    List<dynamic> whereArgs = [];

    if (bookId != null) {
      whereClause = 'book_id = ?';
      whereArgs.add(bookId);
    }

    if (title != null) {
      if (whereClause.isNotEmpty) {
        whereClause += ' OR ';
      }
      whereClause += 'Title = ?';
      whereArgs.add(title);
    }

    // Perform the deletion
    await db.delete(
      'book',
      where: whereClause,
      whereArgs: whereArgs,
    );

    // Refresh the list of books
    final dbTasks = await SQLHelper().fetchBooks();
    Get.find<HomeController>().getBooksList.clear();
    Get.find<HomeController>().getBooksList.addAll(dbTasks);
  }

  Future<bool> isBookDeleted(int bookId) async {
    final db = await SQLHelper.db();
    final result = await db.query(
      'booksDeleted',
      where: 'book_id = ?',
      whereArgs: [bookId],
    );
    return result.isNotEmpty;
  }


  static Future<int> createData(String title,String? desc,String image) async{
    final db = await SQLHelper.db();
    final data = {"title" : title, "desc" : desc,"image": image};
    final id = await db.insert("book", data,conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String,dynamic>>> getAllData()async{
    final db =  await SQLHelper.db();
    return db.query("book",orderBy: "ID");
  }

  static Future<List<Map<String,dynamic>>> getSingleData(int id) async {
    final db = await SQLHelper.db();
    return db.query("book",where: "ID = ?", whereArgs: [id],limit: 1);
  }

  static Future<int> updateData(int id, String title, String? desc,String? image) async {
    final db = await SQLHelper.db();
    final data = {
     "title" : title,
     "desc" : desc,
     "createdAt" : DateTime.now().toString(),
      "image": image
    };
    final result = await db.update("data",data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteData(int id) async {
    print(id);
    final db = await SQLHelper.db();
    try{
      await db.delete("data",where: "id = ?",whereArgs: [id]);
    }catch(e){}
  }
}
