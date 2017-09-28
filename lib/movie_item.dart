import 'package:flutter/material.dart';
import 'movie_data.dart';

class MovieItem extends StatelessWidget {
  MovieData movieData;

  MovieItem(String name, String image, String source) {
    this.movieData = new MovieData(name, image, source);
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Image.network(movieData.image),
        new Text(movieData.name),
        new Text(movieData.source),
      ],
    );
  }
}
