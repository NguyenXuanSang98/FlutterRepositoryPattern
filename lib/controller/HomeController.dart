import 'package:get/get.dart';
import 'package:movie_repository/model/ResuiltMovie.dart';
import 'package:movie_repository/repository/MovieRepository.dart';
import 'package:movie_repository/source/remote/MovieRemoteDataSource.dart';

enum Status { loading, succes, error }

class HomeController extends GetxController {

  final MovieRemoteDataSource movieRemoteDataSource;
  final moviesUpcoming = Rx<ResuiltMovie>();
  final status = Status.loading.obs;

  HomeController({this.movieRemoteDataSource});

  @override
  void onInit() {
    super.onInit();
    getDataMovieUpcoming();
  }

  Future<ResuiltMovie> getDataMovieUpcoming() async {
    return movieRemoteDataSource.getMoviesUpcoming().then((data) {
      moviesUpcoming(data);
      status(Status.succes);
    }, onError: (err) {
      status(Status.error);
    });
  }
}
