import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:top_20_movies/models/cast_model.dart';
import 'package:top_20_movies/utils/constant.dart';
import 'package:top_20_movies/widgets/loading/image_loading.dart';

class CastItem extends StatelessWidget {
  const CastItem({
    super.key,
    required this.cast,
  });

  final CastModel cast;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
        child: ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          cast.profilePath != null
              ? CachedNetworkImage(
                  width: 190,
                  imageUrl: cast.profilePath!,
                  placeholder: (context, url) =>
                      const ImageLoading(width: 190, height: 285),
                )
              : Image.asset(
                  'assets/images/empty_profile_2.jpg',
                  width: 190,
                  height: 285,
                ),
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.black87,
                    Colors.black45,
                    Colors.black12,
                    Colors.transparent
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(kPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      cast.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      cast.character,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
