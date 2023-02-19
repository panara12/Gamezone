import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'model/model.dart';

class Userlist{
  Future<Database> initDatabase() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 'misc.db');
    return await openDatabase(
      databasePath,
      version: 2,
    );
  }

  Future<void> copyPasteAssetFileToRoot() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "misc.db");

    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      ByteData data =
      await rootBundle.load(join('assets/Database', 'misc.db'));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await new File(path).writeAsBytes(bytes);
    }
  }

  Future<List<Loginmodel>> GetDataFromUser() async{
    List<Loginmodel> userlists = [];
    Database db = await initDatabase();
    List<Map<String ,Object?>> data =
    await db.rawQuery('SELECT * FROM Users_gamezone');
    Loginmodel model = Loginmodel();
    model.Emails = 'select email';
    model.password = 'select pass';
    for(int i =0; i<data.length; i++){
      model = Loginmodel();
      model.Emails = data[i]['Emails'].toString();
      model.password = data[i]['password'].toString();
      userlists.add(model);
    }
    return userlists;
  }
}