// import 'package:dio/dio.dart';
// import 'package:hotstar_api/models/spark_model.dart';

// class MovieService {
//   final Dio dio = Dio(
//     BaseOptions(
//       baseUrl: "https://api.themoviedb.org/3/",
//       connectTimeout: const Duration(seconds: 10),
//       receiveTimeout: const Duration(seconds: 10),
//     ),
//   );

//   final String apiKey = "dc05431987a2c74602e148724a106a3a";

//   Future<List<Movie>> fetchNowPlaying() async {
//   try {
//     final response = await dio.get(
//       "movie/now_playing",
//       queryParameters: {"api_key": apiKey},
//     );

//     if (response.statusCode == 200 && response.data['results'] != null) {
//       final List results = response.data['results'];
//       return results.map((json) => Movie.fromJson(json)).toList();
//     }
//     return [];
//   } catch (e) {
//     print("Error: $e");
//     return [];
//   }
// }

// }
