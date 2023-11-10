import 'package:flutter/material.dart';
import 'package:nerds_project/store/cart.dart';
import 'package:nerds_project/store/profile.dart';
import 'package:nerds_project/store/search.dart';
import 'package:nerds_project/store/store_home.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int pageIndex = 0;
  late PageController pageController;
  

  @override
  void initState() {
    super.initState();
    // onLaunch();
    setState(() {});
    pageController = PageController(initialPage: pageIndex);

     pageController.addListener(() {
      setState(() {
        pageIndex = pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: pageController,
        // physics: ,
        children: const [StoreHome(), Search(), Carts(), Profile()],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal:40.0),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          // showSelectedLabels: true,
          // showUnselectedLabels: false,
          elevation: 0,
          currentIndex: pageIndex,
          type: BottomNavigationBarType.fixed,
          onTap: ((index) {
            setState(() {
              pageIndex = index;
            });
            pageController.jumpToPage(index);
          }),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.house), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Shop'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Basket'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    ));
  }
}
