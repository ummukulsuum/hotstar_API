import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hotstar_api/models/search_model.dart';
import 'package:hotstar_api/service/search_service.dart';

class SearchController extends ChangeNotifier {
  final SearchService service = SearchService();

  bool isLoading = true;
  List<SearchModel> movies = [];
  Timer? debounce;

  SearchController() {
    loadMovies();
  }

  Future<void> loadMovies() async {
    try {
      movies = await service.fetchTopRated();
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void searchMovies(String query) {
    if (debounce?.isActive ?? false) debounce!.cancel();

    debounce = Timer(const Duration(milliseconds: 500), () async {
      isLoading = true;
      notifyListeners();

      try {
        movies = query.isEmpty
            ? await service.fetchTopRated()
            : await service.searchMovies(query);
      } catch (e) {
        print("Error: $e");
      } finally {
        isLoading = false;
        notifyListeners();
      }
    });
  }

  @override
  void dispose() {
    debounce?.cancel();
    super.dispose();
  }
}
