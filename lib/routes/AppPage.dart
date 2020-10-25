import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:movie_repository/binding/HomeBinding.dart';
import 'package:movie_repository/ui/Favorite.dart';
import 'package:movie_repository/ui/Home.dart';

import 'AppRoutes.dart';

class AppPage {
  static const INITIAL = AppRoutes.HOME;
  static final routes = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding()
    ),
    GetPage(
      name: AppRoutes.FAVORITE,
      page: () => FavoriteScreen(),
    ),
  ];
}
