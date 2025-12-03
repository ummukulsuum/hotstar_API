import 'package:dio/dio.dart';
import 'package:hotstar_api/models/home_model.dart';

class MovieService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://api.themoviedb.org/3/",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  final String apiKey = "dc05431987a2c74602e148724a106a3a";

  Future<List<MovieModel>> getMovies(String endpoint) async {
    final response = await dio.get(
      endpoint,
      queryParameters: {"api_key": apiKey},
    );

    final List results = response.data["results"];
    return results.map((e) => MovieModel.fromJson(e)).toList();
  }

  Future<List<MovieModel>> fetchPopular() => getMovies("movie/popular");

  Future<List<MovieModel>> fetchTopRated() => getMovies("movie/top_rated");

  Future<List<MovieModel>> fetchUpcoming() => getMovies("movie/upcoming");
}