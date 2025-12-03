// import 'package:dio/dio.dart';
// import 'package:hotstar_api/models/home_model.dart';

// class SearchService {
//   final Dio dio = Dio(BaseOptions(baseUrl: "https://api.themoviedb.org/3/"));
//   final String apiKey = "dc05431987a2c74602e148724a106a3a";

//   Future<List<MovieModel>> fetchTopRated() async {
//     final response = await dio.get("movie/top_rated", queryParameters: {
//       "api_key": apiKey,
//     });

//     List results = response.data['results'];
//     return results.map((e) => MovieModel.fromJson(e)).toList();
//   }

//   Future<List<MovieModel>> searchMovies(String query) async {
//     if (query.isEmpty) return [];
//     final response = await dio.get("search/movie", queryParameters: {
//       "api_key": apiKey,
//       "query": query,
//     });
//     List results = response.data['results'];
//     return results.map((e) => MovieModel.fromJson(e)).toList();
//   }
// }
import 'package:dio/dio.dart';
import 'package:hotstar_api/models/search_model.dart';

class SearchService {
  final Dio dio = Dio(
    BaseOptions(baseUrl: "https://api.themoviedb.org/3/"),
  );

  final String apiKey = "dc05431987a2c74602e148724a106a3a";

  Future<List<SearchModel>> fetchTopRated() async {
    final response = await dio.get("movie/top_rated", queryParameters: {
      "api_key": apiKey,
    });

    List data = response.data['results'];
    return data.map((e) => SearchModel.fromJson(e)).toList();
  }

  Future<List<SearchModel>> searchMovies(String query) async {
    if (query.isEmpty) return [];

    final response = await dio.get("search/movie", queryParameters: {
      "api_key": apiKey,
      "query": query,
    });

    List data = response.data['results'];
    return data.map((e) => SearchModel.fromJson(e)).toList();
  }
}
