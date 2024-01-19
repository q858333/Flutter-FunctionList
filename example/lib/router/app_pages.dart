import 'package:get/get.dart';
import 'package:in_app_purchase_example/page/db_page.dart';

import 'app_routes.dart';

class AppPages {
  static final List<GetPage> routes = [

    // 数据库
    GetPage(name: AppRoutes.DB, page: () => DBPage()),

  ];

  // static final unknownRoute = GetPage(
  //   name: AppRoutes.unKnowPage,
  //   page: () => const UnknownRoutePage(),
  // );

}