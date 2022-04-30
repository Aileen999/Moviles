
import 'package:reto_sqlflite/model/session_model.dart';
import 'package:reto_sqlflite/model/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

abstract class DatabaseService {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'sqlite.db'),
        onCreate: (db, version) async {
      await db.execute(
          "CREATE TABLE user (id INTEGER PRIMARY KEY AUTOINCREMENT, email TEXT,password TEXT, name TEXT, lastName TEXT,state  INTEGER)");
      await db.execute("CREATE TABLE session (idUser INTEGER)");
      return;
    }, version: 1);
  }

  static Future<int> insert(UserModel user) async {
    Database database = await _openDB();
    return database.insert("user", user.toMap());
  }

  static Future<int> delete(UserModel user) async {
    Database database = await _openDB();
    return database.delete("user", where: "id=?", whereArgs: [user.id]);
  }

  static Future<int> update(UserModel user) async {
    Database database = await _openDB();
    return database
        .update("user", user.toMap(), where: "id=?", whereArgs: [user.id]);
  }

  static Future<List<UserModel>> getUser() async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> userMap = await database.query("user");
    return List.generate(
        userMap.length,
        (i) => UserModel(
            userMap[i]['id'],
            userMap[i]['email'],
            userMap[i]['lastName'],
            userMap[i]['password'],
            userMap[i]['name'],
            userMap[i]['state']));
  }

  static Future<UserModel> userGetByEmailPassword(
      String email, String password) async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> userMap = await database.query("user",
        where: "email=? AND password=?",
        whereArgs: [email, password],
        limit: 1);

    if (userMap.isNotEmpty) {
      return UserModel(
        userMap[0]['id'],
        userMap[0]['email'],
        userMap[0]['lastName'],
        userMap[0]['password'],
        userMap[0]['name'],
        userMap[0]['state'],
      );
    } else {
      return UserModel(0, "No Posee", "Anonimo", "No Posee", "Anónimo", 0);
    }
  }

  static Future<int> insertsession(SessionModel session) async {
    Database database = await _openDB();
    return database.insert("session", session.toMap());
  }

  static Future<int> deleteSesion(SessionModel session) async {
    Database database = await _openDB();
    return database.delete("session");
  }

  static Future<SessionModel> getSession() async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> sessionMap = await database.query(
      "session",
    );
    if (sessionMap.isNotEmpty) {
      return SessionModel(sessionMap[0]['idUser']);
    } else {
      return SessionModel(0);
    }
  }


 static Future<UserModel> userGetById(int id) async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> userMap = await database.query("user",
        where: "id=?",
        whereArgs: [id],
        limit: 1);

    if (userMap.isNotEmpty) {
      return UserModel(
        userMap[0]['id'],
        userMap[0]['email'],
        userMap[0]['lastName'],
        userMap[0]['password'],
        userMap[0]['name'],
        userMap[0]['state'],
      );
    } else {
      return UserModel(0, "No Posee", "Anonimo", "No Posee", "Anónimo", 0);
    }
  }

 
}
