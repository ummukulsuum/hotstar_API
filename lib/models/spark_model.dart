class SparkModel {
  final int id;
  final String title;
  final String posterPath;
  final String overview;

  SparkModel({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
  });

  factory SparkModel.fromJson(Map<String, dynamic> json) {
    return SparkModel(
      id: json['id'] ,
      title: json['title'] ,
      posterPath: json['poster_path'],
      overview: json['overview'],
    );
  }

  String get fullPosterPath => posterPath.isNotEmpty
      ? 'https://image.tmdb.org/t/p/w500$posterPath'
      : 'https://via.placeholder.com/500x750?text=No+Image';
}
