// ignore_for_file: depend_on_referenced_packages
import 'package:sqflite_common/sqlite_api.dart';
import 'migration.dart';

class MigrationV1 implements Migration{
  @override
  void create(Batch batch) {
    batch.execute('''
      CREATE TABLE IF NOT EXISTS todo (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        descricao VARCHAR(500) NOT NULL,
        data_hora DATETIME NOT NULL,
        finalizado INTEGER
      )
    ''');
  }

  @override
  void update(Batch batch) {}
}