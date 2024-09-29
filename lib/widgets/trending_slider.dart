import 'package:carousel_slider/carousel_slider.dart';
import 'package:media_recommendation_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:media_recommendation_app/screens/details_screen.dart';

class TrendingSlider extends StatelessWidget {
  const TrendingSlider({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: snapshot.data!.length,
        options: CarouselOptions(
          height: 300,
          autoPlay: true,
          viewportFraction: 0.5, // Verringert den Abstand zwischen den Filmen
          autoPlayCurve: Curves.fastOutSlowIn,
          pageSnapping: true,
          autoPlayAnimationDuration: const Duration(seconds: 1),
        ),
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                    movie: snapshot.data[itemIndex],
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromARGB(255, 255, 32, 32),
                    width: 2), // Grauer Rand
                borderRadius: BorderRadius.circular(8), // Runde Ecken
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  height: 300,
                  width: 200,
                  child: Image.network(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    '${Constants.imageUrl}${snapshot.data[itemIndex].posterPath}',
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
