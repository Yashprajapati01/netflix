// import 'package:flutter/material.dart';
// import 'package:netflix/widgets/Card_view.dart';
// import '../model/movie_model.dart';
// import '../services/api_services.dart';
// import '../widgets/crousel_widget.dart';
// import '../widgets/mov_list.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   List<Movie> movies = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchMovies();
//   }
//
//   void fetchMovies() async {
//     movies = await ApiService.fetchMovies();
//     setState(() {});
//   }
//
//   Widget buildMovieList() {
//     return ListView.builder(
//       itemCount: movies.length,
//       itemBuilder: (context, index) {
//         return CardView(movie: movies[index]);
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var media = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MovieFlix', style: TextStyle(color: Colors.red)),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.only(left: 10, right: 10),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CarouselSliderCard(),
//               SizedBox(height: 20),
//               Text(
//                 "Popular Movies",
//                 textAlign: TextAlign.start,
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 30,
//                     fontWeight: FontWeight.w700),
//               ),
//               SizedBox(height: 20),
//
//               // AllBooksWidget(), // The AllBooksWidget with updated constraints
//               Flex(
//                 direction: Axis.vertical,
//                 children: [AllBooksWidget()],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:netflix/widgets/Card_view.dart';
import '../model/movie_model.dart';
import '../services/api_services.dart';
import '../widgets/crousel_widget.dart';
import '../widgets/mov_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> movies = [];

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  void fetchMovies() async {
    movies = await ApiService.fetchMovies();
    setState(() {});
  }

  Widget buildMovieList() {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return CardView(movie: movies[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar for a collapsible and scrollable header
          SliverAppBar(
            title: Text(
              'NETFLIX',
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 30),
            ),

            backgroundColor: Colors.transparent,
            // Height when expanded
            floating: false, // Keeps app bar visible when scrolled up
            pinned: false,
            actions: [
              Padding(
                padding: const EdgeInsets.only(
                    right: 10.0), // Right padding for alignment
                child: GestureDetector(
                  onTap: () {
                    // Handle account tap, e.g., open profile page
                  },
                  child: Icon(
                    Icons.account_circle,
                    color: Colors.white,
                    size: 40, // Icon size inside the circle
                  ),
                ),
              ),
            ], // Keeps app bar visible when scrolled down
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSliderCard(),
                  SizedBox(height: 20),
                  Text(
                    "Popular Movies",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 20),
                  AllBooksWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
