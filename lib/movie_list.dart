import 'package:flutter/material.dart';
import 'movie_data.dart';
import 'movie_item.dart';

class MovieList extends StatelessWidget {
  MovieList(this.movieList, this.searchQuery);

  final String searchQuery;
  final List<MovieData> movieList;

  @override
  Widget build(BuildContext context) {
    final List<MovieData> filterList = new List<MovieData>();

    for (var i = 0; i < movieList.length; i++) {
      String name = movieList[i]["name"];
      if (name.contains(searchQuery)) {
        filterList.add(new MovieData(movieList[i]["name"],
            movieList[i]["image"], movieList[i]["source"]));
      }
    }
    return new ListView.builder(
      itemCount: filterList == null ? 0 : filterList.length,
      itemBuilder: (BuildContext context, int index) {
        return new Card(
          child: new MovieItem(filterList[index].name,
              filterList[index].image, filterList[index].source),
        );
      },
    );
  }
}
