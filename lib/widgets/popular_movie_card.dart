import 'package:flutter/material.dart';
import '../model/movie_model.dart';

class PopularMovieCard extends StatelessWidget {
  final Movie movie;

  const PopularMovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          movie.imageUrl != null
              ? Image.network(
                  movie.imageUrl!,
                  height: 150,
                  width: 100,
                  fit: BoxFit.cover,
                )
              : Container(
                  height: 150,
                  width: 100,
                  color: Colors.grey,
                  child: Icon(Icons.movie, color: Colors.white),
                ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              movie.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              movie.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
