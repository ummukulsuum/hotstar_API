import 'package:flutter/material.dart';
import 'package:hotstar_api/models/home_model.dart';
import 'package:provider/provider.dart';
import 'package:hotstar_api/controllers/button_controller.dart'; 

class DetailScreen extends StatelessWidget {
  final MovieModel movie;
  const DetailScreen({super.key, required this.movie});
  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ButtonController(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 450, 
              pinned: true,
              backgroundColor: Colors.black,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.zero,
                centerTitle: false,
                background: Stack(
                  children: [

                    movie.posterPath.isNotEmpty
                        ? Image.network(
                            "$baseImageUrl${movie.posterPath}",
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          )
                        : Container(color: Colors.grey.shade900),
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black,
                          ],
                          stops: [0.5, 1.0],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 20,
                      right: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.title.toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "${movie.releaseDate?.split('-')[0] ?? 'N/A'} • TMDB ${movie.voteAverage.toStringAsFixed(1)}/10 • 2h 29m • 7 Languages",
                            style: TextStyle(color: Colors.white.withOpacity(0.7)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: buildWatchNowButton(),
                  ),
                  const SizedBox(height: 15),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildActionButton(Icons.add, "Watchlist", 'watchlist', context),
                        buildActionButton(Icons.share_outlined, "Share", 'share', context),
                        buildActionButton(Icons.arrow_downward_outlined, "Download", 'download', context),
                        buildActionButton(Icons.favorite_border_sharp, "Rate", 'rate', context),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "Action | Sci-Fi | Adventure | Organised Crime",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      movie.overview.isEmpty ? "No overview available for this movie." : movie.overview,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 30),

                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "More Like This",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(height: 12),

                  SizedBox(
                    height: 140,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      children: [
                        buildMoreLikeThisBox(),
                        SizedBox(width: 10),
                        buildMoreLikeThisBox(),
                        SizedBox(width: 10),
                        buildMoreLikeThisBox(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMoreLikeThisBox() {
    return Container(
      height: 140,
      width: 120,
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: const Text("Related", style: TextStyle(color: Colors.white)),
    );
  }

  Widget buildWatchNowButton() {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 127, 24, 146), 
            Color.fromARGB(255, 63, 81, 181), 
            Color.fromARGB(255, 233, 30, 99), 
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ElevatedButton.icon(
        onPressed: () {},
        icon:  Icon(Icons.play_arrow, color: Colors.white),
        label:  Text(
          "Watch Now",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  Widget buildActionButton(IconData icon, String label, String actionType, BuildContext context) {
    return InkWell(
      onTap: () {
        if (actionType == 'watchlist') {
          Provider.of<ButtonController>(context, listen: false).toggleAdd();
        }
      },
      child: Column(
        children: [
          actionType == 'watchlist'
              ? Consumer<ButtonController>(
                  builder: (context, controller, child) {
                    return Icon(
                      controller.isAdded ? Icons.check : Icons.add,
                      color: Colors.white,
                      size: 28,
                    );
                  },
                )
              : Icon(icon, color: Colors.white, size: 28),
           SizedBox(height: 5),
          Text(
            label,
            style:  TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}