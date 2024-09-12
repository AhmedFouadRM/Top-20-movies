import 'package:flutter/material.dart';
import 'package:top_20_movies/models/cast_model.dart';
import 'package:top_20_movies/models/movie_item_model.dart';
import 'package:top_20_movies/models/review_model.dart';

import '../../widgets/tabs/cast_tab.dart';
import '../../widgets/tabs/overview_tab.dart';
import '../../widgets/tabs/production_companies_tab.dart';
import 'movie_view_app_bar.dart';

class MovieView extends StatefulWidget {
  const MovieView({
    super.key,
    required this.movie,
    required this.cast,
    required this.reviews,
  });
  final List<CastModel> cast;
  final MovieItemModel movie;
  final List<ReviewModel> reviews;

  @override
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  List<Tab> tabs = <Tab>[
    const Tab(text: 'Overview'),
  ];
  List<Widget> tabsViews = <Widget>[];
  @override
  void initState() {
    super.initState();
    tabsViews.add(OverviewTab(movie: widget.movie, reviews: widget.reviews));
    if (widget.movie.productionCompanies!.isNotEmpty) {
      tabs.add(const Tab(text: 'Production Companies'));
      tabsViews.add(
          ProductionCompaniesTab(companies: widget.movie.productionCompanies!));
    }
    if (widget.cast.isNotEmpty) {
      tabs.add(const Tab(text: 'Cast'));
      tabsViews.add(CastTab(cast: widget.cast));
    }

    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            MovieViewAppBar(movie: widget.movie),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                TabBar(
                  controller: tabController,
                  tabs: tabs,
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: tabController,
          children: tabsViews,
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
