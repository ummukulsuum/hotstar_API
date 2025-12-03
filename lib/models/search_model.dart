class SearchModel {
  final String title;
  final String posterPath;

  SearchModel({
    required this.title,
    required this.posterPath,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      title: json['title'] ?? '',
      posterPath: json['poster_path'] ?? '',
    );
  }
}
