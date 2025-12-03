import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hotstar_api/service/spark_service.dart';
import '../models/spark_model.dart';

class SparkController extends ChangeNotifier {
  final SparkService service = SparkService();

  List<SparkModel> movies = [];
  bool isLoading = true;

  SparkController() {
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    try {
      isLoading = true;
      notifyListeners();

      movies = await service.fetchTopRated();

      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      log('Error fetching movies: $e');
    }
  }
}
