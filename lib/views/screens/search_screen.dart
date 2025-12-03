import 'package:flutter/material.dart' hide SearchController;
import 'package:hotstar_api/controllers/search_controller.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SearchController(),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: Consumer<SearchController>(
            builder: (context, search, _) {
              return TextField(
                controller: searchController,
                style: const TextStyle(color: Colors.white),
                onChanged: search.searchMovies,
                decoration: InputDecoration(
                  hintText: "Search movies...",
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                  filled: true,
                  fillColor: Colors.grey.shade900,
                  prefixIcon: const Icon(Icons.search, color: Colors.white),
                  isDense: true,
                  contentPadding: const EdgeInsets.all(12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              );
            },
          ),
        ),

        body: Consumer<SearchController>(
          builder: (context, controller, child) {
            if (controller.isLoading) {
              return shimmerGrid();
            }
            return movieGrid(controller.movies);
          },
        ),
      ),
    );
  }


  Widget shimmerGrid() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 6,
        crossAxisSpacing: 6,
        childAspectRatio: 0.65,
      ),
      itemCount: 12,
      itemBuilder: (_, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade800,
          highlightColor: Colors.grey.shade600,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(color: Colors.grey.shade900),
          ),
        );
      },
    );
  }

  Widget movieGrid(List movies) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 6,
        crossAxisSpacing: 6,
        childAspectRatio: 0.65,
      ),
      itemCount: movies.length,
      itemBuilder: (_, index) {
        final movie = movies[index];
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            "https://image.tmdb.org/t/p/w500${movie.posterPath}",
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) =>
                Container(color: Colors.grey.shade900),
          ),
        );
      },
    );
  }
}
