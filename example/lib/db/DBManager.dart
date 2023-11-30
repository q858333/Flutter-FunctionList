import 'package:in_app_purchase_example/db/model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class DBManager {
  static final DBManager _instance = DBManager._internal();

  factory DBManager() => _instance;

  DBManager._internal();

  static DBManager _getInstance() {
    return _instance;
  }

    static late Isar _database;

   static void configDB() async {
    final dir = await getApplicationDocumentsDirectory();

    String name = "11111.isar";
    Isar? temp = Isar.getInstance(name);
    if (temp != null) {
      _database = temp;
      print("=== openIsarInstanceForUser already exist");
      return ;
    }

    Isar isar = await Isar.open(
      [FriendInfoSchema],
      directory: dir.path,
      name: name,
    );
    _database = isar;
  }

  static Future<List<FriendInfo>> readUser() async {

    List<FriendInfo> result = await _database.friendInfos.where().findAll();
    return result;
  }


  static Future<void> addUser() async {

    FriendInfo friendInfo = FriendInfo();
    friendInfo
      ..name = "name"
      ..avatar = "avatar"
      ..phone = "phone";

    await _database.writeTxn(() async {
      await _database.friendInfos.put(friendInfo); // 将新用户数据写入到 Isar
    });
  }
}