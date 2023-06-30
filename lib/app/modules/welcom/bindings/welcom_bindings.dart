import 'package:aplication/app/modules/welcom/controllers/welcom_controllers.dart';
import 'package:get/get.dart';

class WelcomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomControllers>(
      () => WelcomControllers(),
    );
  }
}
