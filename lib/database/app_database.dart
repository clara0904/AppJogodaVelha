import 'package:drift/drift.dart';
import 'package:drift/native.dart';

part 'app_database.g.dart'; 

@DataClassName('GameResult')
class GameResults extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get vencedor => text().withLength(min: 1, max: 50)(); 
  DateTimeColumn get date => dateTime().withDefault(Constant(DateTime.now()))();
}

@DriftDatabase(tables: [GameResults])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(NativeDatabase.memory());

  @override
  // TODO: implement schemaVersion
  int get schemaVersion => 1;

  Future<void> addGame(GameResultsCompanion game) async {
    await into(gameResults).insert(game);
  }

  Future<List<GameResult>> getAllResults() async {
    return await select(gameResults).get();
  }
  
}
