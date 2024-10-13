import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:rentalin_id/controllers/webview_controller.dart';

import '../../../data/constant/color.dart';
import '../../../widgets/app_bar.components.dart';
import '../controllers/webview_controller.dart';

class WebViewPage extends GetView<MyWebController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: tdBg,
        toolbarHeight: 100,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: const AppBarComponents(
          nameMenu: 'Web View',
        ),
      ),
      body: Obx(
        () => Stack(
          children: [
            // Menampilkan WebView menggunakan WebViewWidget
            WebViewWidget(controller: controller.webViewController),
            // Menampilkan loading indicator saat halaman sedang dimuat
            controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
