import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shimmer/shimmer.dart';

class MovieModel {
  final String title;
  final String posterPath;

  MovieModel({required this.title, required this.posterPath});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['title'] ?? '',
      posterPath: json['poster_path'] ?? '',
    );
  }
}

class MovieService {
  final Dio dio = Dio(BaseOptions(baseUrl: "https://api.themoviedb.org/3/"));
  final String apiKey = "dc05431987a2c74602e148724a106a3a";

  Future<List<MovieModel>> fetchTopRated() async {
    final response = await dio.get("movie/top_rated", queryParameters: {
      "api_key": apiKey,
    });

    List results = response.data['results'];
    return results.map((e) => MovieModel.fromJson(e)).toList();
  }

  Future<List<MovieModel>> searchMovies(String query) async {
    if (query.isEmpty) return [];
    final response = await dio.get("search/movie", queryParameters: {
      "api_key": apiKey,
      "query": query,
    });
    List results = response.data['results'];
    return results.map((e) => MovieModel.fromJson(e)).toList();
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool _isLoading = true;
  List<MovieModel> movies = [];
  final MovieService service = MovieService();
  final TextEditingController searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  Future<void> loadMovies() async {
    try {
      movies = await service.fetchTopRated();
    } catch (e) {
      print("Error fetching movies: $e");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      setState(() {
        _isLoading = true;
      });
      try {
        movies = await service.searchMovies(query);
      } catch (e) {
        print("Error searching movies: $e");
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: TextField(
          controller: searchController,
          style: const TextStyle(color: Colors.white),
          onChanged: onSearchChanged,
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
        ),
      ),
      body: _isLoading ? shimmerGrid() : movieGrid(),
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

  Widget movieGrid() {
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
            errorBuilder: (_, __, ___) => Container(color: Colors.grey.shade900),
          ),
        );
      },
    );
  }
}
