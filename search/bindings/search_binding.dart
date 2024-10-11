import 'package:get/get.dart';

import '../controllers/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchingController>(
      () => SearchingController(),
    );
  }
}

class SearchAvailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchingAvailController>(
      () => SearchingAvailController(),
    );
  }
}

class SearchBookedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchingBookedController>(
      () => SearchingBookedController(),
    );
  }
}

class SearchRentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchingRentController>(
      () => SearchingRentController(),
    );
  }
}
