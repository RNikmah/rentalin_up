import 'package:get/get.dart';
import 'package:rentalin_id/app/modules/Rent/views/rent1_view.dart';

import '../modules/Rent/bindings/rent_binding.dart';
import '../modules/Rent/views/rent2_view.dart';
import '../modules/Rent/views/rent3_view.dart';
import '../modules/Rent/views/rent4_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/searchAll_view.dart';
import '../modules/search/views/searchAvail_view.dart';
import '../modules/search/views/searchBooked_view.dart';
import '../modules/search/views/searchRent_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SIGNUP;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.SEARCHAVAIL, 
      page: () => SearchAvailView(),
      binding: SearchAvailBinding(),
    ),
    GetPage(
      name: _Paths.SEARCHBOOKED, 
      page: () => SearchBookedView(),
      binding: SearchBookedBinding(),
    ),
    GetPage(
      name: _Paths.SEARCHRENT, 
      page: () => SearchRentView(),
      binding: SearchRentBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.RENT1, 
      page: () => Rent1View(),
      binding: Rent1Binding(),
    ),
    GetPage(
      name: _Paths.RENT2, 
      page: () => Rent2View(),
      binding: Rent2Binding(),
    ),
    GetPage(
      name: _Paths.RENT3, 
      page: () => Rent3View(),
      binding: Rent3Binding(),
    ),
    GetPage(
      name: _Paths.RENT4, 
      page: () => Rent4View(),
      binding: Rent4Binding(),
    ),
  ];
}
