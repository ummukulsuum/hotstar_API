import 'package:flutter/material.dart';

class SparksScreen extends StatelessWidget {
  const SparksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 🔥 TOP BANNER (Black Container)
            Container(
              height: 350,
              width: double.infinity,
              color: Colors.black,
              child: Container(
                color: Colors.grey.shade900,
              ),
            ),

            const SizedBox(height: 20),

            // ⭐ Episode info
            Center(
              child: Text(
                "New Episode Weekly",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 15,
                ),
              ),
            ),

            const SizedBox(height: 8),

            Center(
              child: Text(
                "33L Views • The Rebel Kid • Hindi • Reality",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 13,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ▶ Watch Now + Add Button
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Watch Now Button
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xff007bff),
                          Color(0xffb315f5)
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.play_arrow, color: Colors.white),
                        SizedBox(width: 6),
                        Text(
                          "Watch Now",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(width: 15),

                  // Add Button
                  Container(
                    height: 46,
                    width: 46,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔘 Indicator dots
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: index == 0 ? Colors.white : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // -------------------------------
            // ⭐ Freshly Dropped
            // -------------------------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Freshly Dropped",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemBuilder: (_, i) {
                  return Container(
                    width: 220,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            // -------------------------------
            // ⭐ Binge with Domino's
            // -------------------------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Binge with Domino's",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemBuilder: (_, i) {
                  return Container(
                    width: 220,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
