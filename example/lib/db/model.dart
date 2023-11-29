
import 'package:isar/isar.dart';

part 'model.g.dart';

@collection
class FriendInfo {
  Id id = Isar.autoIncrement; // 你也可以用 id = null 来表示 id 是自增的

  @Index()
  String? name;
  String? avatar;
  String? phone;
}