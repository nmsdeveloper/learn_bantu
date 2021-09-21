import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:learn_bantu/variables/style.dart';
import 'package:learn_bantu/screens/home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int isPage = 0;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff5b86e5),
      body: Container(
        width: _width,
        height: _height,
        decoration: bgGradient(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: _height / 1.10,
              child: PageView(
                controller: _pageController,
                onPageChanged: (val) => setState(() {
                  isPage = val;
                }),
                children: const [
                  HomeScreen(),
                ],
              ),
            ),
            SizedBox(
              height: _height / 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    _pageController.jumpToPage(0);
                  },
                  icon: Icon(
                    BootstrapIcons.app_indicator,
                    color: isPage == 0
                        ? const Color(0xffff5e62)
                        : const Color(0xffffffff),
                    size: _height / 25,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _pageController.jumpToPage(1);
                  },
                  icon: Icon(
                    BootstrapIcons.controller,
                    color: isPage == 1
                        ? const Color(0xffff5e62)
                        : const Color(0xffffffff),
                    size: _height / 25,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _pageController.jumpToPage(2);
                  },
                  icon: Icon(
                    BootstrapIcons.clipboard_data,
                    color: isPage == 2
                        ? const Color(0xffff5e62)
                        : const Color(0xffffffff),
                    size: _height / 25,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _pageController.jumpToPage(3);
                  },
                  icon: Icon(
                    BootstrapIcons.gear,
                    color: isPage == 3
                        ? const Color(0xffff5e62)
                        : const Color(0xffffffff),
                    size: _height / 25,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
