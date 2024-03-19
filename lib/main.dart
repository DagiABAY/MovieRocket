import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_rocket/modules/movie_page/movie_binding.dart';
import 'package:movie_rocket/modules/movie_page/movie_page.dart';
import 'package:movie_rocket/modules/splash_page.dart';

void main() {
  runApp(
    SplashPage(
      onInitalizationComplete: () => runApp(
        const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MoviePage(),
      initialBinding: MovieBinding(),
      //routes: ,
    );
  }
}
