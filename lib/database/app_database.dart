import 'package:drift/drift.dart';

part 'app_database.g.dart'; 

@DataClassName('GameResult')
class GameResults extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get vencedor => text().withLength(min: 1, max: 50)(); 
}

@DriftDatabase(tables: [GameResults])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  // TODO: implement schemaVersion
  int get schemaVersion => throw UnimplementedError();

  void insertResult(GameResult gameResult) {}
  
}
