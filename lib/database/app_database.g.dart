// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $GameResultsTable extends GameResults
    with TableInfo<$GameResultsTable, GameResult> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GameResultsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _vencedorMeta =
      const VerificationMeta('vencedor');
  @override
  late final GeneratedColumn<String> vencedor = GeneratedColumn<String>(
      'vencedor', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, vencedor];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'game_results';
  @override
  VerificationContext validateIntegrity(Insertable<GameResult> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('vencedor')) {
      context.handle(_vencedorMeta,
          vencedor.isAcceptableOrUnknown(data['vencedor']!, _vencedorMeta));
    } else if (isInserting) {
      context.missing(_vencedorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GameResult map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GameResult(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      vencedor: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}vencedor'])!,
    );
  }

  @override
  $GameResultsTable createAlias(String alias) {
    return $GameResultsTable(attachedDatabase, alias);
  }
}

class GameResult extends DataClass implements Insertable<GameResult> {
  final int id;
  final String vencedor;
  const GameResult({required this.id, required this.vencedor});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['vencedor'] = Variable<String>(vencedor);
    return map;
  }

  GameResultsCompanion toCompanion(bool nullToAbsent) {
    return GameResultsCompanion(
      id: Value(id),
      vencedor: Value(vencedor),
    );
  }

  factory GameResult.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GameResult(
      id: serializer.fromJson<int>(json['id']),
      vencedor: serializer.fromJson<String>(json['vencedor']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'vencedor': serializer.toJson<String>(vencedor),
    };
  }

  GameResult copyWith({int? id, String? vencedor}) => GameResult(
        id: id ?? this.id,
        vencedor: vencedor ?? this.vencedor,
      );
  GameResult copyWithCompanion(GameResultsCompanion data) {
    return GameResult(
      id: data.id.present ? data.id.value : this.id,
      vencedor: data.vencedor.present ? data.vencedor.value : this.vencedor,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GameResult(')
          ..write('id: $id, ')
          ..write('vencedor: $vencedor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, vencedor);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GameResult &&
          other.id == this.id &&
          other.vencedor == this.vencedor);
}

class GameResultsCompanion extends UpdateCompanion<GameResult> {
  final Value<int> id;
  final Value<String> vencedor;
  const GameResultsCompanion({
    this.id = const Value.absent(),
    this.vencedor = const Value.absent(),
  });
  GameResultsCompanion.insert({
    this.id = const Value.absent(),
    required String vencedor,
  }) : vencedor = Value(vencedor);
  static Insertable<GameResult> custom({
    Expression<int>? id,
    Expression<String>? vencedor,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (vencedor != null) 'vencedor': vencedor,
    });
  }

  GameResultsCompanion copyWith({Value<int>? id, Value<String>? vencedor}) {
    return GameResultsCompanion(
      id: id ?? this.id,
      vencedor: vencedor ?? this.vencedor,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (vencedor.present) {
      map['vencedor'] = Variable<String>(vencedor.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GameResultsCompanion(')
          ..write('id: $id, ')
          ..write('vencedor: $vencedor')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $GameResultsTable gameResults = $GameResultsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [gameResults];
}

typedef $$GameResultsTableCreateCompanionBuilder = GameResultsCompanion
    Function({
  Value<int> id,
  required String vencedor,
});
typedef $$GameResultsTableUpdateCompanionBuilder = GameResultsCompanion
    Function({
  Value<int> id,
  Value<String> vencedor,
});

class $$GameResultsTableFilterComposer
    extends Composer<_$AppDatabase, $GameResultsTable> {
  $$GameResultsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get vencedor => $composableBuilder(
      column: $table.vencedor, builder: (column) => ColumnFilters(column));
}

class $$GameResultsTableOrderingComposer
    extends Composer<_$AppDatabase, $GameResultsTable> {
  $$GameResultsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get vencedor => $composableBuilder(
      column: $table.vencedor, builder: (column) => ColumnOrderings(column));
}

class $$GameResultsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GameResultsTable> {
  $$GameResultsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get vencedor =>
      $composableBuilder(column: $table.vencedor, builder: (column) => column);
}

class $$GameResultsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GameResultsTable,
    GameResult,
    $$GameResultsTableFilterComposer,
    $$GameResultsTableOrderingComposer,
    $$GameResultsTableAnnotationComposer,
    $$GameResultsTableCreateCompanionBuilder,
    $$GameResultsTableUpdateCompanionBuilder,
    (GameResult, BaseReferences<_$AppDatabase, $GameResultsTable, GameResult>),
    GameResult,
    PrefetchHooks Function()> {
  $$GameResultsTableTableManager(_$AppDatabase db, $GameResultsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GameResultsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GameResultsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GameResultsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> vencedor = const Value.absent(),
          }) =>
              GameResultsCompanion(
            id: id,
            vencedor: vencedor,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String vencedor,
          }) =>
              GameResultsCompanion.insert(
            id: id,
            vencedor: vencedor,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$GameResultsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GameResultsTable,
    GameResult,
    $$GameResultsTableFilterComposer,
    $$GameResultsTableOrderingComposer,
    $$GameResultsTableAnnotationComposer,
    $$GameResultsTableCreateCompanionBuilder,
    $$GameResultsTableUpdateCompanionBuilder,
    (GameResult, BaseReferences<_$AppDatabase, $GameResultsTable, GameResult>),
    GameResult,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$GameResultsTableTableManager get gameResults =>
      $$GameResultsTableTableManager(_db, _db.gameResults);
}
