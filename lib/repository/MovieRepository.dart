import 'package:movie_repository/api/ApiService.dart';
import 'package:movie_repository/model/ResuiltMovie.dart';
import 'package:movie_repository/source/remote/MovieRemoteDataSource.dart';

class MovieRepository extends MovieRemoteDataSource{
  final ApiService apiService;

  MovieRepository({this.apiService});
  @override
  Future<ResuiltMovie> getMoviesUpcoming() {
      return apiService.getMoviesUpcoming();
  }
}
