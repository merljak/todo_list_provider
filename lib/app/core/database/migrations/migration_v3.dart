// ignore_for_file: depend_on_referenced_packages

import 'package:sqflite_common/sqlite_api.dart';
import 'migration.dart';

class MigrationV3 implements Migration{
  @override
  void create(Batch batch) {
    batch.execute('''
      CREATE TABLE IF NOT EXISTS teste2 (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
    ''');
  }

  @override
  void update(Batch batch) {
     batch.execute('''
      CREATE TABLE IF NOT EXISTS teste2 (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
    ''');
  }
  
}