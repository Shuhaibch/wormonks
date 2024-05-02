import 'package:get/get.dart';
import 'package:wormonks/data/repository/login_repository.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginRepository());
  }
}
