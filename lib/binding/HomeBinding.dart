import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:movie_repository/api/ApiInstance.dart';
import 'package:movie_repository/api/ApiService.dart';
import 'package:movie_repository/controller/HomeController.dart';
import 'package:movie_repository/repository/MovieRepository.dart';
import 'package:movie_repository/source/remote/MovieRemoteDataSource.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiService(dio: ApiInstance.getInstance()));
    Get.lazyPut<MovieRemoteDataSource>(() => MovieRepository(apiService: Get.find()));
    Get.lazyPut(() => HomeController(movieRemoteDataSource: Get.find()));
  }
}
