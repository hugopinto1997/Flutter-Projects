import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import './models/album.dart';
import './models/albums.dart';
 
class DBHelper {
  static Database _db;
  // Create the Table colums
  static const String TABLE = 'albums';
  static const String ALBUM_ID = 'albumId';
  static const String ID = 'id';
  static const String TITLE = 'title';
  static const String URL = 'url';
  static const String THUMBNAIL_URL = 'thumbnailUrl';
  static const String DB_NAME = 'albums.db';
 
  // Initialize the Database
  Future<Database> get db async {
    if (null != _db) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }
 
  initDb() async {
    // Get the Device's Documents directory to store the Offline Database...
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }
 
  _onCreate(Database db, int version) async {
    // Create the DB Table
    await db.execute(
        "CREATE TABLE $TABLE ($ID INTEGER PRIMARY KEY, $ALBUM_ID TEXT, $TITLE TEXT, $URL TEXT, $THUMBNAIL_URL TEXT)");
  }
 
  // Method to insert the Album record to the Database
  Future<Album> save(Album album) async {
    var dbClient = await db;
    // this will insert the Album object to the DB after converting it to a json
    album.id = await dbClient.insert(TABLE, album.toJson());
    return album;
  }
 
  // Method to return all Albums from the DB
  Future<Albums> getAlbums() async {
    var dbClient = await db;
    // specify the column names you want in the result set
    List<Map> maps =
        await dbClient.query(TABLE, columns: [ID, TITLE, URL, THUMBNAIL_URL]);
    Albums allAlbums = Albums();
    List<Album> albums = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        albums.add(Album.fromJson(maps[i]));
      }
    }
    allAlbums.albums = albums;
    return allAlbums;
  }
 
  // Method to delete an Album from the Database
  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(TABLE, where: '$ID = ?', whereArgs: [id]);
  }
 
  // Method to Update an Album in the Database
  Future<int> update(Album album) async {
    var dbClient = await db;
    return await dbClient
        .update(TABLE, album.toJson(), where: '$ID = ?', whereArgs: [album.id]);
  }
 
  // Method to Truncate the Table
  Future<void> truncateTable() async {
    var dbClient = await db;
    return await dbClient.delete(TABLE);
  }
 
  // Method to Close the Database
  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}