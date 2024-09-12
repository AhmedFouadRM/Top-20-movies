import 'package:flutter/material.dart';
import 'package:top_20_movies/models/movie_item_model.dart';
import 'package:top_20_movies/services/movies_servies.dart';
import 'package:top_20_movies/widgets/loading/wide_movie_loading.dart';
import 'package:top_20_movies/widgets/wideMovies/wide_movie_item.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key, required this.endpoint});
  final Endpoints endpoint;
  static const id = '/category_view';
  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  final _scrollController = ScrollController();
  final _list = <MovieItemModel>[];
  int _currentPage = 1;
  bool _isLoading = false;
  MoviesServices moviesServices = MoviesServices();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMore);
    _fetchData(_currentPage, widget.endpoint);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _fetchData(int pageKey, Endpoints endpoint) async {
    setState(() {
      _isLoading = true;
    });

    List<MovieItemModel> data =
        await moviesServices.getMoviesList(endpoint, pageKey);
    setState(() {
      _list.addAll(data);
      _isLoading = false;
    });
  }

  void _loadMore() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !_isLoading) {
      _currentPage++;
      _fetchData(_currentPage, widget.endpoint);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Top 20 Movies')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          controller: _scrollController,
          itemCount: _list.length + (_isLoading ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == _list.length) {
              return const WideMovieLoading();
            } else {
              return WideMovieItem(item: _list[index]);
            }
          },
        ),
      ),
    );
  }
}
