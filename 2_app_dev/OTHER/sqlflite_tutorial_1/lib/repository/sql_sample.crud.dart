
// class SqlSampleCrudRepository {
//   static Future<Sample> create(Sample sample) async {
//     var db = await SqlDB().database;
//     var id = await db?.insert(Sample.tableName, sample.toJson());
//     return sample.clone(id: id);
//   }

//   static Future<List<Sample>?> getList() async {

//       var db = await SqlDB().database;
//       var results = await db?.query(Sample.tableName, columns: [
//         SampleFields.id,
//         SampleFields.name,
//         SampleFields.yn,
//         SampleFields.createdAt
//       ]);
//       return results?.map(
//         (data) {
//           return Sample.fromJson(data);
//         },
//       ).toList();
//   }
// }

import 'package:sqlflite_tutorial_1/repository/sql_db.dart';

import '../models/sample.dart';

class SqlSampleCrudRepository {
  static Future<Sample> create(Sample sample) async {
    var db = await SqlDB.instance.database;
    var id = await db.insert(Sample.tableName, sample.toJson());
    return sample.clone(id: id);
  }

  static Future<List<Sample>?> getList() async {
    var db = await SqlDB.instance.database;

    var results = await db.query(Sample.tableName,
        columns: [
          SampleFields.id,
          SampleFields.name,
          SampleFields.yn,
          SampleFields.createdAt,
        ],
        orderBy: '${SampleFields.createdAt} DESC');

    return results.map((data) => Sample.fromJson(data)).toList();
  }

  static Future<Sample?> getOne(int id) async {
    var db = await SqlDB.instance.database;

    var results = await db.query(
      Sample.tableName,
      columns: [
        SampleFields.id,
        SampleFields.name,
        SampleFields.yn,
        SampleFields.value,
        SampleFields.createdAt,
      ],
      where: '${SampleFields.id} = ?',
      whereArgs: [id],
    );
    var list = results.map((data) => Sample.fromJson(data)).toList();
    if (list.isNotEmpty) {
      return list.first;
    } else {
      return null;
    }
  }

  static Future<int> update(Sample sample) async {
    var db = await SqlDB.instance.database;
    return await db.update(
      Sample.tableName,
      sample.toJson(),
      where: '${SampleFields.id} = ?',
      whereArgs: [sample.id],
    );
  }

  static Future<int?> delete(int id) async {
    var db = await SqlDB.instance.database;
    return await db.delete(
      Sample.tableName,
      where: '${SampleFields.id} = ?',
      whereArgs: [id],
    );
  }
}
