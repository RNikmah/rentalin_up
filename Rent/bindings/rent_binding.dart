import 'package:get/get.dart';

import '../controllers/rent_controller.dart';

class Rent1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Rent1Controller>(
      () => Rent1Controller(),
    );
  }
}

class Rent2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Rent2Controller>(
      () => Rent2Controller(),
    );
  }
}

class Rent3Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Rent3Controller>(
      () => Rent3Controller(),
    );
  }
}

class Rent4Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Rent4Controller>(
      () => Rent4Controller(),
    );
  }
}
