import 'package:get/get.dart';

import '../controllers/webview_controller.dart';

class WebViewBinding extends Bindings {
  @override
  void dependencies() {
    // Inject WebViewController ketika halaman diakses
    Get.lazyPut<MyWebController>(
      () => MyWebController());
  }
}
