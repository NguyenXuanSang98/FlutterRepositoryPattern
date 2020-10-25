class Movie{
  int id;
  String posterPath;
  String title;

  Movie({this.id, this.posterPath, this.title,});

  Movie.fromJson(Map<String, dynamic> json) {
    posterPath = json['poster_path'];
    id = json['id'];
    title = json['title'];
  }
}
