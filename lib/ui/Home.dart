import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:movie_repository/controller/HomeController.dart';
import 'package:movie_repository/model/Movie.dart';

class HomeScreen extends GetView<HomeController>{
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: Text("Film Upcoming",style: TextStyle(color: Colors.black),),
          actions: [
            IconButton(icon: Icon(Icons.favorite,color: Colors.red,), onPressed: null)
          ],
        ),
        body: Center(
          child: Obx(
              (){
                final status = controller.status.value;
                if (status == Status.loading) return CircularProgressIndicator();
                if (status == Status.error) return Text('Error on connection :(');
                return Container(
                  margin: const EdgeInsets.fromLTRB(5,5,5,5),
                  child: GridView.builder(itemCount: controller.moviesUpcoming.value.movies.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.width*2)), itemBuilder: (BuildContext context,int index){
                    return MovieItem(movie: controller.moviesUpcoming.value.movies[index],);
                  }),
                );
              }
          ),
        ),
      );
  }
}

class MovieItem extends StatelessWidget{
  const MovieItem({Key key, this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(5,5,5,5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                    child: Image.network("https://image.tmdb.org/t/p/w500/"+movie.posterPath,fit: BoxFit.cover,)),
              ),
              Container(
                child: Center(child: Text(movie.title)),
              )
            ],
        ),
      ),
    );
  }
}
