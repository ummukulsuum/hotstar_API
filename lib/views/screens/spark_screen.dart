import 'package:flutter/material.dart';
import 'package:hotstar_api/controllers/spark_controller.dart';
import 'package:hotstar_api/models/spark_model.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SparksScreen extends StatelessWidget {
  const SparksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SparkController(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Consumer<SparkController>(
          builder: (context, controller, _) {
            if (controller.isLoading) {
              return const Center(
                  child: CircularProgressIndicator(color: Colors.white));
            }

            // Split the movies list
            final carouselMovies = controller.movies.length >= 5
                ? controller.movies.sublist(0, 5)
                : controller.movies;

            final firstListMovies = controller.movies.length > 5
                ? controller.movies.sublist(5, controller.movies.length >= 10 ? 10 : controller.movies.length)
                : [];

            final secondListMovies = controller.movies.length > 10
                ? controller.movies.sublist(10)
                : [];

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🔥 TOP BANNER (Carousel)
                  if (carouselMovies.isNotEmpty)
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 350,
                        viewportFraction: 1.0,
                        autoPlay: true,
                      ),
                      items: carouselMovies.map((movie) {
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(movie.fullPosterPath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                  const SizedBox(height: 20),

                  // ⭐ Episode info
                  Center(
                    child: Text(
                      "New Episode Weekly",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 15,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  Center(
                    child: Text(
                      "33L Views • The Rebel Kid • Hindi • Reality",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 13,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ▶ Watch Now + Add Button
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 12),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xff007bff), Color(0xffb315f5)],
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.play_arrow, color: Colors.white),
                              SizedBox(width: 6),
                              Text(
                                "Watch Now",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 15),
                        Container(
                          height: 46,
                          width: 46,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.add, color: Colors.white),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // 🔘 Indicator dots (static for now)
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        carouselMovies.length,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: index == 0 ? Colors.white : Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Freshly Dropped
                  if (firstListMovies.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: const Text(
                        "Freshly Dropped",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  const SizedBox(height: 15),
                  if (firstListMovies.isNotEmpty)
                    SizedBox(
                      height: 140,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: firstListMovies.length,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        itemBuilder: (_, i) {
                          SparkModel movie = firstListMovies[i];
                          return Container(
                            width: 220,
                            margin: const EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(movie.fullPosterPath),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          );
                        },
                      ),
                    ),

                  const SizedBox(height: 30),

                  // Binge with Domino's
                  if (secondListMovies.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: const Text(
                        "Binge with Domino's",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  const SizedBox(height: 15),
                  if (secondListMovies.isNotEmpty)
                    SizedBox(
                      height: 140,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: secondListMovies.length,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        itemBuilder: (_, i) {
                          SparkModel movie = secondListMovies[i];
                          return Container(
                            width: 220,
                            margin: const EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(movie.fullPosterPath),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          );
                        },
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
