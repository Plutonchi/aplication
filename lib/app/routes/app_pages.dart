import 'package:aplication/app/modules/auth/bindings/auth_binding.dart';
import 'package:aplication/app/modules/auth/views/admin_auth_view/auth_view.dart';
import 'package:aplication/app/modules/categories/bindings/categories_bindings.dart';
import 'package:aplication/app/modules/categories/views/english_category_view.dart';
import 'package:aplication/app/modules/receipt/bindings/receipt_bindings.dart';
import 'package:aplication/app/modules/receipt/views/receipt_view.dart';
import 'package:aplication/app/modules/welcom/bindings/welcom_bindings.dart';
import 'package:aplication/app/modules/welcom/views/welcome_view.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.AUTH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.RECEIPT,
      page: () =>  ReceiptView(),
      binding: ReceiptBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORIES,
      page: () => EnglishCategory(),
      binding: CategoriesBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBindings(),
    )
  ];
}
