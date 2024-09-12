import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:top_20_movies/models/cast_model.dart';

import 'cast_item.dart';

class CastTab extends StatelessWidget {
  const CastTab({
    super.key,
    required this.cast,
  });

  final List<CastModel> cast;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double itemwidth = 190;
    double crossAxisCount = screenWidth / (itemwidth);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: MasonryGridView.count(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cast.length,
              mainAxisSpacing: 10,
              crossAxisCount: crossAxisCount.toInt(),
              itemBuilder: (context, index) {
                return CastItem(cast: cast[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
