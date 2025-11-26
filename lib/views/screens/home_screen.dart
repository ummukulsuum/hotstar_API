// // import 'package:flutter/material.dart';
// // import 'package:carousel_slider/carousel_slider.dart';
// // import 'package:hotstar_api/models/home_model.dart';
// // import 'package:hotstar_api/service/home_service.dart';
// // import 'package:shimmer/shimmer.dart';

// // class HomeScreen extends StatefulWidget {
// //   const HomeScreen({super.key});

// //   @override
// //   State<HomeScreen> createState() => _HomeScreenState();
// // }

// // class _HomeScreenState extends State<HomeScreen> {
// //   MovieService service = MovieService();

// //   List<MovieModel> popular = [];
// //   List<MovieModel> topRated = [];
// //   List<MovieModel> upcoming = [];

// //   bool isLoading = true;

// //   @override
// //   void initState() {
// //     super.initState();
// //     loadMovies();
// //   }

// // Future<void> loadMovies() async {
// //   try {
// //     popular = await service.fetchPopular();
// //     topRated = await service.fetchTopRated();
// //     upcoming = await service.fetchUpcoming();
// //   } catch (e) {
// //     print("LOAD ERROR: $e");
// //   }

// //   setState(() {
// //     isLoading = false;
// //   });
// // }

// //   // SHIMMER BOX
// //   Widget shimmerBox(double height, double width) {
// //     return Shimmer.fromColors(
// //       baseColor: Colors.grey.shade800,
// //       highlightColor: Colors.grey.shade600,
// //       child: Container(
// //         height: height,
// //         width: width,
// //         decoration: BoxDecoration(
// //           color: Colors.grey.shade900,
// //           borderRadius: BorderRadius.circular(10),
// //         ),
// //       ),
// //     );
// //   }

// //   // STATIC SHIMMER ROWS
// //   Widget shimmerRow() {
// //     return SizedBox(
// //       height: 140,
// //       child: ListView.separated(
// //         scrollDirection: Axis.horizontal,
// //         padding: const EdgeInsets.symmetric(horizontal: 20),
// //         itemCount: 6,
// //         itemBuilder: (context, index) {
// //           return shimmerBox(140, 120);
// //         },
// //         separatorBuilder: (_, __) => const SizedBox(width: 10),
// //       ),
// //     );
// //   }

// //   // ROW VIEW FOR MOVIES
// //   Widget movieRow(List<MovieModel> list) {
// //     return SizedBox(
// //       height: 140,
// //       child: ListView.separated(
// //         scrollDirection: Axis.horizontal,
// //         padding: const EdgeInsets.symmetric(horizontal: 20),
// //         itemCount: list.length,
// //         itemBuilder: (context, index) {
// //           final movie = list[index];
// //           return ClipRRect(
// //             borderRadius: BorderRadius.circular(10),
// //             child: Image.network(
// //               "https://image.tmdb.org/t/p/w500${movie.posterPath}",
// //               height: 140,
// //               width: 120,
// //               fit: BoxFit.cover,
// //             ),
// //           );
// //         },
// //         separatorBuilder: (_, __) => const SizedBox(width: 10),
// //       ),
// //     );
// //   }

// //   // SECTION TITLE
// //   Widget sectionTitle(String title) {
// //     return Padding(
// //       padding: const EdgeInsets.only(left: 20),
// //       child: Align(
// //         alignment: Alignment.centerLeft,
// //         child: Text(
// //           title,
// //           style: const TextStyle(
// //             color: Colors.white,
// //             fontSize: 20,
// //             fontWeight: FontWeight.w700,
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(backgroundColor: Colors.black),
// //       backgroundColor: Colors.black,
// //       body: SingleChildScrollView(
// //         child: Column(
// //           children: [
// //             // CAROUSEL
// //             isLoading
// //                 ? shimmerBox(400, double.infinity)
// //                 : CarouselSlider(
// //                     items: popular.map((movie) {
// //                       return ClipRRect(
// //                         borderRadius: BorderRadius.circular(10),
// //                         child: Image.network(
// //                           "https://image.tmdb.org/t/p/w500${movie.posterPath}",
// //                           width: double.infinity,
// //                           fit: BoxFit.cover,
// //                         ),
// //                       );
// //                     }).toList(),
// //                     options: CarouselOptions(
// //                       height: 400,
// //                       autoPlay: true,
// //                       enlargeCenterPage: true,
// //                     ),
// //                   ),

// //             const SizedBox(height: 25),

// //             // POPULAR
// //             sectionTitle("Popular"),
// //             const SizedBox(height: 12),
// //             isLoading ? shimmerRow() : movieRow(popular),

// //             const SizedBox(height: 25),

// //             // TOP RATED
// //             sectionTitle("Top Rated"),
// //             const SizedBox(height: 12),
// //             isLoading ? shimmerRow() : movieRow(topRated),

// //             const SizedBox(height: 25),

// //             // UPCOMING
// //             sectionTitle("Upcoming"),
// //             const SizedBox(height: 12),
// //             isLoading ? shimmerRow() : movieRow(upcoming),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }



// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:hotstar_api/controllers/button_controller.dart';
// import 'package:provider/provider.dart';
// import 'package:hotstar_api/models/home_model.dart';
// import 'package:hotstar_api/service/home_service.dart';
// import 'package:shimmer/shimmer.dart';


// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final MovieService service = MovieService();

//   List<MovieModel> popular = [];
//   List<MovieModel> topRated = [];
//   List<MovieModel> upcoming = [];

//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     loadMovies();
//   }

//   Future<void> loadMovies() async {
//     try {
//       popular = await service.fetchPopular();
//       topRated = await service.fetchTopRated();
//       upcoming = await service.fetchUpcoming();
//     } catch (e) {
//       print("LOAD ERROR: $e");
//     }

//     setState(() {
//       isLoading = false;
//     });
//   }

//   Widget shimmerBox(double height, double width) {
//     return Shimmer.fromColors(
//       baseColor: Colors.grey.shade800,
//       highlightColor: Colors.grey.shade600,
//       child: Container(
//         height: height,
//         width: width,
//         decoration: BoxDecoration(
//           color: Colors.grey.shade900,
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//     );
//   }

//   Widget shimmerRow() {
//     return SizedBox(
//       height: 140,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         itemCount: 6,
//         itemBuilder: (context, index) => shimmerBox(140, 120),
//         separatorBuilder: (_, __) => const SizedBox(width: 10),
//       ),
//     );
//   }

//   // ROW VIEW FOR MOVIES
//   Widget movieRow(List<MovieModel> list) {
//     return SizedBox(
//       height: 140,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         itemCount: list.length,
//         itemBuilder: (context, index) {
//           final movie = list[index];
//           return ClipRRect(
//             borderRadius: BorderRadius.circular(10),
//             child: Image.network(
//               "https://image.tmdb.org/t/p/w500${movie.posterPath}",
//               height: 140,
//               width: 120,
//               fit: BoxFit.cover,
//             ),
//           );
//         },
//         separatorBuilder: (_, __) => const SizedBox(width: 10),
//       ),
//     );
//   }

//   // SECTION TITLE
//   Widget sectionTitle(String title) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 20),
//       child: Align(
//         alignment: Alignment.centerLeft,
//         child: Text(
//           title,
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 20,
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => ButtonController(),
//       child: Scaffold(
//         appBar: AppBar(backgroundColor: Colors.black),
//         backgroundColor: Colors.black,
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               // CAROUSEL
//               isLoading
//                   ? shimmerBox(400, double.infinity)
//                   : CarouselSlider(
//                       items: popular.map((movie) {
//                         return ClipRRect(
//                           borderRadius: BorderRadius.circular(10),
//                           child: Image.network(
//                             "https://image.tmdb.org/t/p/w500${movie.posterPath}",
//                             width: double.infinity,
//                             fit: BoxFit.cover,
//                           ),
//                         );
//                       }).toList(),
//                       options: CarouselOptions(
//                         height: 400,
//                         autoPlay: true,
//                         enlargeCenterPage: true,
//                       ),
//                     ),

//               const SizedBox(height: 20),

//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         height: 40,
//                         decoration: BoxDecoration(
//                           gradient: const LinearGradient(
//                             colors: [
//                               Colors.purple,
//                               Colors.blue,
//                               Colors.pinkAccent,
//                             ],
//                             begin: Alignment.topLeft,
//                             end: Alignment.bottomRight,
//                           ),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: ElevatedButton.icon(
//                           onPressed: () {
//                           },
//                           icon: const Icon(
//                             Icons.play_arrow,
//                             color: Colors.white,
//                           ),
//                           label: const Text(
//                             "Watch Now",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.transparent,
//                             shadowColor: Colors.transparent,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 12),

//                     Expanded(
//                       child: Consumer<ButtonController>(
//                         builder: (context, controller, _) {
//                           return ElevatedButton(
                            
//                             onPressed: controller.toggleAdd,
//                             style: ElevatedButton.styleFrom(
                              
//                               backgroundColor: Colors.white,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
                                
//                               ),
//                             ),
//                             child: Icon(
//                               controller.isAdded ? Icons.check : Icons.add,
//                               color: controller.isAdded
//                                   ? Colors.purple
//                                   : Colors.black,
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 25),

//               sectionTitle("Popular"),
//               const SizedBox(height: 12),
//               isLoading ? shimmerRow() : movieRow(popular),

//               const SizedBox(height: 25),

//               sectionTitle("Top Rated"),
//               const SizedBox(height: 12),
//               isLoading ? shimmerRow() : movieRow(topRated),

//               const SizedBox(height: 25),

//               sectionTitle("Upcoming"),
//               const SizedBox(height: 12),
//               isLoading ? shimmerRow() : movieRow(upcoming),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hotstar_api/views/widgets/home_detail.dart';
import 'package:provider/provider.dart';
import 'package:hotstar_api/models/home_model.dart';
import 'package:hotstar_api/service/home_service.dart';
import 'package:shimmer/shimmer.dart';
import 'package:hotstar_api/controllers/button_controller.dart'; 

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MovieService service = MovieService();

  List<MovieModel> popular = [];
  List<MovieModel> topRated = [];
  List<MovieModel> upcoming = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  Future<void> loadMovies() async {
    try {
      popular = await service.fetchPopular();
      topRated = await service.fetchTopRated();
      upcoming = await service.fetchUpcoming();
    } catch (e) {
      print("LOAD ERROR: $e");
    }

    setState(() {
      isLoading = false;
    });
  }

  Widget shimmerBox(double height, double width) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade800,
      highlightColor: Colors.grey.shade600,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget shimmerRow() {
    return SizedBox(
      height: 140,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: 6,
        itemBuilder: (context, index) => shimmerBox(140, 120),
        separatorBuilder: (_, __) => const SizedBox(width: 10),
      ),
    );
  }

  Widget movieRow(List<MovieModel> list) {
    return SizedBox(
      height: 140,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: list.length,
        itemBuilder: (context, index) {
          final movie = list[index];
          
          if(movie.posterPath.isEmpty) return const SizedBox.shrink(); // Skip movies without poster

          return InkWell( // <--- WRAPPED IN INKWELL FOR TAP GESTURE
            onTap: () {
              // Navigate to the DetailScreen, passing the selected movie object
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(movie: movie),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                height: 140,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 10),
      ),
    );
  }

  // SECTION TITLE
  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ButtonController(),
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.black),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // CAROUSEL
              isLoading
                  ? shimmerBox(400, double.infinity)
                  : CarouselSlider(
                      items: popular.map((movie) {
                        return InkWell(
                          onTap: () {
                            // Navigation for carousel image as well
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(movie: movie),
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: movie.posterPath.isNotEmpty
                                ? Image.network(
                                    "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  )
                                : Container(color: Colors.grey.shade900),
                          ),
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: 400,
                        autoPlay: true,
                        enlargeCenterPage: true,
                      ),
                    ),

              const SizedBox(height: 20),

              // Placeholder for Watch Now Button (Not needed on home screen if Carousel/Row items are tappable)
              // This section seems redundant if the items are leading to the detail page.
              // I've kept a simplified version as in the original code, but this typically
              // goes on the detail screen.

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Colors.purple,
                              Colors.blue,
                              Colors.pinkAccent,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ElevatedButton.icon(
                          onPressed: () {
                             // This is usually for the main movie in a carousel. 
                             // We'll link it to the first popular movie for now.
                             if (popular.isNotEmpty) {
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                   builder: (context) => DetailScreen(movie: popular.first),
                                 ),
                               );
                             }
                          },
                          icon: const Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          ),
                          label: const Text(
                            "Watch Now",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),

                    Expanded(
                      child: Consumer<ButtonController>(
                        builder: (context, controller, _) {
                          return ElevatedButton(
                            
                            onPressed: controller.toggleAdd,
                            style: ElevatedButton.styleFrom(
                              
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                
                              ),
                            ),
                            child: Icon(
                              controller.isAdded ? Icons.check : Icons.add,
                              color: controller.isAdded
                                  ? Colors.purple
                                  : Colors.black,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              sectionTitle("Popular"),
              const SizedBox(height: 12),
              isLoading ? shimmerRow() : movieRow(popular),

              const SizedBox(height: 25),

              sectionTitle("Top Rated"),
              const SizedBox(height: 12),
              isLoading ? shimmerRow() : movieRow(topRated),

              const SizedBox(height: 25),

              sectionTitle("Upcoming"),
              const SizedBox(height: 12),
              isLoading ? shimmerRow() : movieRow(upcoming),
              
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}