import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:top_20_movies/models/movie_item_model.dart';
import 'package:top_20_movies/widgets/trendMovies/trend_item.dart';

class TrendSlider extends StatelessWidget {
  const TrendSlider({
    super.key,
    required this.trendList,
  });

  final List<MovieItemModel> trendList;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemBuilder: (context, index, realIndex) => TrendItem(
        trendModel: trendList[index],
      ),
      itemCount: trendList.length,
      options: CarouselOptions(
        height: 400,
        aspectRatio: 9 / 16,
        viewportFraction: 0.7,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
