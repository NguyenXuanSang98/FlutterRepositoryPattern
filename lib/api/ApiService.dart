import 'package:dio/dio.dart';
import 'package:movie_repository/api/ApiInstance.dart';
import 'package:movie_repository/model/ResuiltMovie.dart';

class ApiService{
  final Dio dio;

  ApiService({this.dio});
    Future<ResuiltMovie> getMoviesUpcoming() async{
        try{
          final response = await dio.get("/movie/upcoming",queryParameters: {"api_key":"6b33ddff475acb3ae48a5a0198f9de8a","page":1});
          return ResuiltMovie.fromJson(response.data);
        } on Exception catch(e){
          print('Error '+e.toString());
        }
    }
}
