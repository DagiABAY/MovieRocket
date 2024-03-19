import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  final VoidCallback onInitalizationComplete;
  const SplashPage({super.key, required this.onInitalizationComplete});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 10),
      () => widget.onInitalizationComplete(),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MovieRocket",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Container(
            height: 350,
            width: 350,
            decoration: const BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage("assets/images/mm.png"),
            )),
            child: const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Developed by: dagi@softs(Getx)",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
