import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:top_20_movies/utils/constant.dart';
import 'package:top_20_movies/widgets/loading/image_loading.dart';

class ProductionCompaniesTab extends StatelessWidget {
  const ProductionCompaniesTab({
    super.key,
    required this.companies,
  });

  final List<String> companies;

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
              itemCount: companies.length,
              mainAxisSpacing: 10,
              crossAxisCount: crossAxisCount.toInt(),
              itemBuilder: (context, index) {
                return UnconstrainedBox(
                  child: Card(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CachedNetworkImage(
                        width: 170,
                        imageUrl: companies[index],
                        placeholder: (context, url) => const ImageLoading(
                          height: kPosterWidth,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
