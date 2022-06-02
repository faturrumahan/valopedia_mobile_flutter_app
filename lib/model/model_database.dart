import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:valopedia/model/model_agent.dart';

part 'model_database.g.dart';

@HiveType(typeId: 0)
class FavoriteSkin extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String photo;

  FavoriteSkin(
      {required this.name,
      required this.photo});

  @override
  String toString() {
    return 'Favorite{id: $id, name: $name, uuid: $photo}';
  }
}
