// import 'package:dio/dio.dart';
// import 'package:hotstar_api/models/home_model.dart';

// class MovieService {
//     final Dio dio = Dio(BaseOptions(
//   baseUrl: "https://api.themoviedb.org/3/",
//   connectTimeout: const Duration(seconds: 15),
//   receiveTimeout: const Duration(seconds: 15),
// ));

//   final String apiKey = "dc05431987a2c74602e148724a106a3a";

//   Future<List<MovieModel>> fetchTopRated() async {
//     final response = await dio.get("movie/top_rated", queryParameters: {
//       "api_key": apiKey,
//     });

//     List results = response.data['results'];
//     return results.map((e) => MovieModel.fromJson(e)).toList();
//   }
// }
