import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  displaySplash() {
    Timer(const Duration(seconds: 6), () async {
      Navigator.pushReplacementNamed(context, "/authtabs");
      // Navigator.pushReplacementNamed(context, "/storeTabs");
    });
  }
  // FA8232

  @override
  void initState() {
    super.initState();
    displaySplash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Artify",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 20,),
            LoadingAnimationWidget.threeRotatingDots(
              color: Colors.purpleAccent,
              size: 100,
            ),
          ],
        ),
      ),
    );
  }
}
