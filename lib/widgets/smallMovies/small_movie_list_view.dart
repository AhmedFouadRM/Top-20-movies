import 'package:flutter/material.dart';
import 'package:top_20_movies/models/movie_item_model.dart';
import 'package:top_20_movies/services/movies_servies.dart';
import 'package:top_20_movies/views/category_view.dart';

import 'small_movie_item.dart';

class SmallMovieListView extends StatelessWidget {
  const SmallMovieListView({
    super.key,
    required this.movieList,
    required this.name,
    required this.endpoint,
  });
  final List<MovieItemModel> movieList;
  final String name;
  final Endpoints endpoint;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
          child: Row(
            children: [
              Text(
                name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Spacer(
                flex: 1,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, CategoryView.id,
                      arguments: endpoint);
                },
                child: const Row(
                  children: [
                    Text(
                      'See more',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.chevron_right),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movieList.length,
            itemBuilder: (context, index) => SmallMovieItem(
              movieItemModel: movieList[index],
            ),
          ),
        ),
      ],
    );
  }
}
