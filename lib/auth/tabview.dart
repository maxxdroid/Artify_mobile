import 'package:flutter/services.dart';

import 'sign_up.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'sign_in.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                // Status bar color
                statusBarColor: Colors.purple,
              ),
              toolbarHeight: 10,
              backgroundColor: Colors.white,
              elevation: 0,
              bottom: const TabBar(
                  dragStartBehavior: DragStartBehavior.start,
                  labelColor: Colors.black,
                  isScrollable: true,
                  labelPadding: EdgeInsets.symmetric(horizontal: 30),
                  tabs: [
                    Tab(
                      text: "Sign In",
                    ),
                    Tab(
                      text: "Sign Up",
                    ),
                  ]),
            ),
            body: const TabBarView(children: [SignIn(), SignUp()]),
          )),
    );
  }
}
