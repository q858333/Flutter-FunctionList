
import 'package:flutter/material.dart';

import '../db/DBManager.dart';
import '../db/model.dart';

class DBPage extends StatefulWidget {
  DBPage({Key? key}) : super(key: key);

  @override
  _DBPageState createState() => _DBPageState();
}

class _DBPageState extends State<DBPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDB();
  }


  void initDB() async {
    DBManager.configDB();
    await Future.delayed(const Duration(seconds: 3));
    await DBManager.addUser();
    List list  = await DBManager.readUser();
    FriendInfo info = list.first;
    await DBManager.delete(info.id);
    await Future.delayed(const Duration(seconds: 3));

    List newList  = await DBManager.readUser();

    print(' List $list');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("数据库"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
            },
            child: Text('hive'),
          ),
        ],
      ),
    );
  }
}