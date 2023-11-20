import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:nerds_project/functions/shared_pref.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  bool status = false;

  displaySplash() async {
    Timer(const Duration(seconds: 6), () async {
      status
          ? Navigator.pushReplacementNamed(context, "/storeTabs")
          : Navigator.pushReplacementNamed(context, "/authtabs");
    });
  }

  check () async {
    status = (await SharedPrefHelper().getUserStatus())!;
  }

  @override
  void initState() {
    check();
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
            const SizedBox(
              height: 20,
            ),
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
