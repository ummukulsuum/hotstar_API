import 'package:flutter/material.dart';
import 'package:hotstar_api/service/home_service.dart';
import 'package:hotstar_api/models/home_model.dart';

class HomeController extends ChangeNotifier {
  final MovieService service = MovieService();

  List<MovieModel> popular = [];
  List<MovieModel> topRated = [];
  List<MovieModel> upcoming = [];

  bool isLoading = true;

  HomeController() {
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

    isLoading = false;
    notifyListeners();
  }
}
