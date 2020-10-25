import 'package:movie_repository/model/ResuiltMovie.dart';

abstract class MovieRemoteDataSource{
    Future<ResuiltMovie> getMoviesUpcoming();
}
