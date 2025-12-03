import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

import 'package:hotstar_api/controllers/home_controller.dart';
import 'package:hotstar_api/controllers/button_controller.dart';
import 'package:hotstar_api/views/widgets/home_detail.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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

  Widget movieRow(List list, BuildContext ctx) {
    return SizedBox(
      height: 140,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: list.length,
        itemBuilder: (context, index) {
          final movie = list[index];
          if (movie.posterPath.isEmpty) return const SizedBox.shrink();

          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailScreen(movie: movie),
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeController()),
        ChangeNotifierProvider(create: (_) => ButtonController()),
      ],
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.black),
        backgroundColor: Colors.black,
        body: Consumer<HomeController>(
          builder: (context, home, child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  home.isLoading
                      ? shimmerBox(400, double.infinity)
                      : CarouselSlider(
                          items: home.popular.map((movie) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        DetailScreen(movie: movie),
                                  ),
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
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

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              if (home.popular.isNotEmpty) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => DetailScreen(
                                        movie: home.popular.first),
                                  ),
                                );
                              }
                            },
                            icon: const Icon(Icons.play_arrow,
                                color: Colors.white),
                            label: const Text(
                              "Watch Now",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: Consumer<ButtonController>(
                            builder: (context, controller, child) {
                              return ElevatedButton(
                                onPressed: controller.toggleAdd,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Icon(
                                  controller.isAdded
                                      ? Icons.check
                                      : Icons.add,
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
                  home.isLoading
                      ? shimmerRow()
                      : movieRow(home.popular, context),

                  const SizedBox(height: 25),

                  sectionTitle("Top Rated"),
                  const SizedBox(height: 12),
                  home.isLoading
                      ? shimmerRow()
                      : movieRow(home.topRated, context),

                   SizedBox(height: 25),

                  sectionTitle("Upcoming"),
                  const SizedBox(height: 12),
                  home.isLoading
                      ? shimmerRow()
                      : movieRow(home.upcoming, context),

                  const SizedBox(height: 40),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
