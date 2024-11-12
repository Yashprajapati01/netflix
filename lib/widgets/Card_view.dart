import 'package:flutter/material.dart';
import '../model/movie_model.dart';
import '../screens/detail_screen.dart';

class CardView extends StatelessWidget {
  final Movie movie;

  CardView({required this.movie});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(movie.imageUrl.toString(),
          width: 50, fit: BoxFit.cover),
      title: Text(movie.title),
      subtitle:
          Text(movie.description, maxLines: 2, overflow: TextOverflow.ellipsis),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DetailsScreen(movie: movie)),
      ),
    );
  }
}
