// class Movie {
//   final String title;
//   final String imageUrl;

//   Movie({required this.title, required this.imageUrl});

//   factory Movie.fromJson(Map<String, dynamic> json) {
//     return Movie(
//       title: json['title'] ?? "No Title",
//       imageUrl: json['poster_path'] != null
//           ? "https://image.tmdb.org/t/p/w500${json['poster_path']}"
//           : "https://via.placeholder.com/500x750?text=No+Image",
//     );
//   }
// }
