import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hotstar_api/models/home_model.dart';
import 'package:hotstar_api/service/home_service.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MovieService service = MovieService();

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

  // SHIMMER BOX
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

  // STATIC SHIMMER ROWS
  Widget shimmerRow() {
    return SizedBox(
      height: 140,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: 6,
        itemBuilder: (context, index) {
          return shimmerBox(140, 120);
        },
        separatorBuilder: (_, __) => const SizedBox(width: 10),
      ),
    );
  }

  // ROW VIEW FOR MOVIES
  Widget movieRow(List<MovieModel> list) {
    return SizedBox(
      height: 140,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: list.length,
        itemBuilder: (context, index) {
          final movie = list[index];
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              "https://image.tmdb.org/t/p/w500${movie.posterPath}",
              height: 140,
              width: 120,
              fit: BoxFit.cover,
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
    return Scaffold(
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
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 400,
                      autoPlay: true,
                      enlargeCenterPage: true,
                    ),
                  ),

            const SizedBox(height: 25),

            // POPULAR
            sectionTitle("Popular"),
            const SizedBox(height: 12),
            isLoading ? shimmerRow() : movieRow(popular),

            const SizedBox(height: 25),

            // TOP RATED
            sectionTitle("Top Rated"),
            const SizedBox(height: 12),
            isLoading ? shimmerRow() : movieRow(topRated),

            const SizedBox(height: 25),

            // UPCOMING
            sectionTitle("Upcoming"),
            const SizedBox(height: 12),
            isLoading ? shimmerRow() : movieRow(upcoming),
          ],
        ),
      ),
    );
  }
}
