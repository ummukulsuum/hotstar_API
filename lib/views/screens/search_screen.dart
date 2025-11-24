import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool _showShimmer = true;

  @override
  void initState() {
    super.initState();
    // After 2 seconds, stop shimmer and show black containers
    Timer(const Duration(seconds: 2), () {
      setState(() {
        _showShimmer = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: TextField(
          style: const TextStyle(color: Colors.white),
          onChanged: (value) {},
          decoration: InputDecoration(
            hintText: "Search movies...",
            hintStyle: TextStyle(color: Colors.grey.shade500),
            filled: true,
            fillColor: Colors.grey.shade900,
            prefixIcon: const Icon(Icons.search, color: Colors.white),
            isDense: true,
            contentPadding: const EdgeInsets.all(12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
      body: _showShimmer ? shimmerGrid() : blackGrid(),
    );
  }

  Widget shimmerGrid() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.65,
      ),
      itemCount: 12,
      itemBuilder: (_, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade800,
          highlightColor: Colors.grey.shade600,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(color: Colors.grey.shade900),
          ),
        );
      },
    );
  }

  Widget blackGrid() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.65,
      ),
      itemCount: 12,
      itemBuilder: (_, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(color: Colors.grey.shade900),
        );
      },
    );
  }
}
