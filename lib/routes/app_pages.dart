import 'package:get/get.dart';
import '../modules/home/views/home_view.dart';
import '../modules/search/views/search_view.dart';

class AppPages {
  static const initial = '/home';

  static final routes = [
    GetPage(
      name: '/home',
      page: () => const HomeView(),
    ),
    GetPage(
      name: '/search',
      page: () => const SearchView(),
    ),
  ];
}
