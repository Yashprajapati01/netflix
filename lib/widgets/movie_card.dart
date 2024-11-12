// import 'package:flutter/material.dart';
// import '../model/movie_model.dart';
// import '../screens/detail_screen.dart';
//
// class MovieCard extends StatelessWidget {
//   final Movie movie;
//
//   const MovieCard({required this.movie});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => DetailsScreen(movie: movie)),
//         );
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.grey[850],
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Image
//             Image(movie: movie),
//             // Movie Title
//             Title(movie: movie),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class Title extends StatelessWidget {
//   const Title({
//     super.key,
//     required this.movie,
//   });
//
//   final Movie movie;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(8.0),
//       child: Text(
//         movie.title,
//         style: TextStyle(
//           color: Colors.white,
//           fontWeight: FontWeight.bold,
//         ),
//         maxLines: 1,
//         overflow: TextOverflow.ellipsis,
//       ),
//     );
//   }
// }
//
// class Image extends StatelessWidget {
//   const Image({
//     super.key,
//     required this.movie,
//   });
//
//   final Movie movie;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 250,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
//         image: DecorationImage(
//           image: movie.imageUrl != null
//               ? NetworkImage(movie.imageUrl!)
//               : AssetImage('assets/img.png'),
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../model/movie_model.dart';
import '../screens/detail_screen.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailsScreen(movie: movie)),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image with rounded shape
            MovieImage(movie: movie),
            // Movie Title
            MovieTitle(movie: movie),
          ],
        ),
      ),
    );
  }
}

class MovieTitle extends StatelessWidget {
  const MovieTitle({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
      ),
      child: Text(
        movie.title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class MovieImage extends StatelessWidget {
  const MovieImage({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: movie.imageUrl != null
                ? NetworkImage(movie.imageUrl!)
                : AssetImage('assets/img.png') as ImageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
