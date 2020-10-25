import 'package:movie_repository/model/Movie.dart';

class ResuiltMovie{
  List<Movie> movies;
  int page;
  ResuiltMovie({this.movies,this.page});
  ResuiltMovie.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      movies = new List<Movie>();
      json['results'].forEach((v) {
        movies.add(new Movie.fromJson(v));
      });
    }
    page = json['page'];
  }
}
