import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebController extends GetxController {
  final String url = 'https://chibirentalmotormalang.com/';
  
  late final WebViewController webViewController;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    // Menginisialisasi WebViewController di sini
    webViewController = WebViewController();
    loadWebView();
  }

  void loadWebView() {
    webViewController.loadRequest(Uri.parse(url));
    webViewController.setJavaScriptMode(JavaScriptMode.unrestricted);
    webViewController.setNavigationDelegate(
      NavigationDelegate(
        onPageStarted: (String url) {
          updateLoadingStatus(true);
        },
        onPageFinished: (String url) {
          updateLoadingStatus(false);
        },
      ),
    );
  }

  void updateLoadingStatus(bool status) {
    isLoading.value = status;
  }
}
