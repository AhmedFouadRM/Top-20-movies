import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:top_20_movies/models/production_company_model.dart';

class ProductionCompanyItem extends StatelessWidget {
  const ProductionCompanyItem({
    super.key,
    required this.company,
  });

  final ProductionCompanyModel company;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          if (company.logoPath != null)
            Container(
              color: Theme.of(context).colorScheme.surfaceVariant,
              child: CachedNetworkImage(
                width: 200,
                imageUrl: company.logoPath!,
              ),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(company.name),
                  Text('Location: ${company.originCountry}'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
