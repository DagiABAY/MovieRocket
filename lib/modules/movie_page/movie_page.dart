import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_rocket/models/movie.dart';
import 'package:movie_rocket/modules/movie_page/movie_controller.dart';
import 'package:movie_rocket/utils/configs.dart';
import 'package:movie_rocket/utils/search_cate.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  final TextEditingController _searchEditingController =
      TextEditingController();
  late double _deviceHeight;
  late double _deviceWidth;
  late MovieController _pagecontroller;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return _buildUI();
  }

  Widget _buildUI() {
    return GetBuilder<MovieController>(builder: (controller) {
      _pagecontroller = controller;
      return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Obx(() {
            return Container(
              height: _deviceHeight,
              width: _deviceWidth,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  _backgroundUI(),
                  _foregroundUI(),
                ],
              ),
            );
          }));
    });
  }

  Widget _backgroundUI() {
    return Container(
      height: _deviceHeight,
      width: _deviceWidth,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/back.jpg"), fit: BoxFit.cover),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 15.0,
          sigmaY: 15.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
          ),
        ),
      ),
    );
  }

  Widget _foregroundUI() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, _deviceHeight * 0.07, 0, 0),
      width: _deviceWidth * 0.90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          _topBar(),
          Container(
            height: _deviceHeight * 0.83,
            padding: EdgeInsets.symmetric(
              horizontal: _deviceHeight * 0.01,
            ),
            child: _movieListView(),
          )
        ],
      ),
    );
  }

  Widget _topBar() {
    return Container(
      height: _deviceHeight * 0.08,
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _searchField(),
          _categorySelection(),
        ],
      ),
    );
  }

  Widget _searchField() {
    const border = InputBorder.none;
    return Container(
      width: _deviceWidth * 0.50,
      height: _deviceHeight * 0.05,
      child: TextField(
        controller: _pagecontroller.searchText,
        onSubmitted: (_input) {
          _pagecontroller.searchCate.value = '';
          _pagecontroller.updateTextSearch(_input);
        },
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
            focusedBorder: border,
            border: border,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            hintStyle: TextStyle(color: Colors.white54),
            filled: false,
            fillColor: Colors.white24,
            hintText: "Search..."),
      ),
    );
  }

  Widget _categorySelection() {
    return DropdownButton(
        dropdownColor: Colors.black38,
        value: _pagecontroller.searchCate.value,
        icon: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        underline: Container(
          height: 1,
          color: Colors.white24,
        ),
        items: [
          DropdownMenuItem(
            value: SearchCategory.popular,
            child: Text(
              SearchCategory.popular,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          DropdownMenuItem(
            value: SearchCategory.upcoming,
            child: Text(
              SearchCategory.upcoming,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          DropdownMenuItem(
            value: SearchCategory.toprated,
            child: Text(
              SearchCategory.toprated,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          DropdownMenuItem(
            value: SearchCategory.none,
            child: Text(
              SearchCategory.none,
              style: const TextStyle(color: Colors.white),
            ),
          )
        ],
        onChanged: (_value) => _value.toString().isNotEmpty
            ? _pagecontroller.updateSearchCategory(_value)
            : null);
  }

  Widget _movieListView() {
    return NotificationListener(
      onNotification: (notification) {
        if (notification is ScrollEndNotification) {
          final before = notification.metrics.extentBefore;
          final max = notification.metrics.maxScrollExtent;
          if (before == max) {
            _pagecontroller.getMovies();
            return true;
          }
          return false;
        } else {
          return false;
        }
      },
      child: ListView.builder(
        itemCount: _pagecontroller.movies.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.symmetric(
                vertical: _deviceHeight * 0.01,
                horizontal: 0,
              ),
              child: GestureDetector(
                  onTap: () {},
                  child: MyListTile(
                    height: _deviceHeight * 0.20,
                    width: _deviceWidth * 0.85,
                    movie: _pagecontroller.movies[index],
                  )));
        },
      ),
    );
  }
}

class MyListTile extends StatelessWidget {
  final double height;
  final double width;
  final Movie movie;
  const MyListTile({
    super.key,
    required this.height,
    required this.width,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    // final x = Config.setUp();
    final baseImageUrl = Config.baseImageApiUrl;
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height,
            width: width * 0.35,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("$baseImageUrl${movie.posterPath}"),
              ),
            ),
          ),
          Container(
            height: height,
            width: width * 0.66,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: width * 0.56,
                      child: Text(
                        movie.name.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Text(
                      movie.rating!.toStringAsFixed(1),
                      style: const TextStyle(color: Colors.white, fontSize: 22),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, height * 0.02, 0, 0),
                  child: Text(
                    "${movie.language.toString().toUpperCase()}|${movie.isAdult} | ${movie!.releaseDate.toString()}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 0.07, 0, 0),
                  child: Text(
                    movie.description.toString(),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white70, fontSize: 17),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
