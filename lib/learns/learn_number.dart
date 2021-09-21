import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learn_bantu/variables/learn.dart';
import 'package:learn_bantu/variables/list.dart';
import 'package:learn_bantu/variables/style.dart';
import 'package:learn_bantu/pages/home.dart';

class LearnNumber extends StatefulWidget {
  const LearnNumber({Key? key}) : super(key: key);

  @override
  _LearnNumberState createState() => _LearnNumberState();
}

class _LearnNumberState extends State<LearnNumber> {
  int isPage = 0;
  final int _pageLenght = imagesNum.length + trueNum.length;

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: _height / 75,
          vertical: _height / 50,
        ),
        decoration: bgGradient(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /*=============== BAR ===============*/
            buildBar(
              context: context,
              isPage: isPage,
              pageController: () => _pageController.animateToPage(
                imagesNum.length - 1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear,
              ),
              height: _height,
            ),
            /*=============== BAR ===============*/

            /*=============== COURS QUELQUES OBJETS ===============*/
            SizedBox(
              height: _height / 1.25,
              child: PageView.builder(
                physics: isPage < imagesNum.length
                    ? const ClampingScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                controller: _pageController,
                onPageChanged: (val) => setState(() {
                  isPage = val;
                }),
                scrollDirection: Axis.horizontal,
                itemCount: _pageLenght,
                itemBuilder: (context, index) {
                  return _buildPage(
                    width: _width,
                    height: _height,
                    index: index,
                  );
                },
              ),
            ),
            /*=============== COURS QUELQUES OBJETS ===============*/

            /*=============== INDICATEUR QUELQUES OBJETS ===============*/
            isPage < imagesNum.length
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: buildIndicators(
                      height: _height,
                      isPage: isPage,
                      isI: imagesNum.length + 1,
                      horiHei: 300,
                    ),
                  )
                : Container(),
            /*=============== INDICATEUR QUELQUES OBJETS ===============*/
          ],
        ),
      ),
    );
  }

  _buildPage({
    required double width,
    required double height,
    required int index,
  }) {
    List<Widget> _object = [];
    for (var i = 0; i < imagesNum.length; i++) {
      _object.add(
        buildObject(
          width: width,
          height: height,
          head: "text",
          image: imagesNum[i],
          nom: tranlateNum[i]['name'],
          traduction: tranlateNum[i]['translate'],
        ),
      );
    }
    List<Widget> _exercice = [];
    for (var i = 0; i < trueNum.length; i++) {
      _exercice.add(
        _buildExercice(
          height: height,
          index: i,
          quest: quesNum[i],
          trueRep: trueNum[i],
          next: () => i != trueNum.length - 1
              ? _setTimer()
              : Timer(
                  const Duration(milliseconds: 500),
                  () {
                    colorCardLearn[0] = const Color(0xffbbbbbb);
                    colorCardLearn[1] = const Color(0xffbbbbbb);
                    colorCardLearn[2] = const Color(0xffbbbbbb);

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                      (route) => false,
                    );
                  },
                ),
        ),
      );
    }
    var _pages = <Widget>[..._object, ..._exercice];
    return _pages[index];
  }

  _buildExercice({
    required double height,
    required int index,
    required String quest,
    required String trueRep,
    required Function next,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: height / 70,
        vertical: height / 40,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: height / 2,
            height: height / 2.5,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(
                height / 75,
              ),
            ),
            child: Text(
              quest,
              textAlign: TextAlign.center,
              style: textUbuntu(
                color: const Color(0xffaaaaaa),
                weight: FontWeight.bold,
                size: height / 25,
              ),
            ),
          ),
          SizedBox(
            height: height / 40,
          ),
          GestureDetector(
            onTap: () => setState(() {
              if (repNum[index]["rep1"] != trueRep) {
                colorCardLearn[0] = const Color(0xffDC143C);
              } else {
                colorCardLearn[0] = const Color(0xff00FA9A);
                next();
              }
            }),
            child: buildCard(
              height: height,
              rep: repNum[index]["rep1"],
              trueRep: trueRep,
              cardColor: colorCardLearn[0],
            ),
          ),
          SizedBox(
            height: height / 70,
          ),
          GestureDetector(
            onTap: () => setState(() {
              if (repNum[index]["rep2"] != trueRep) {
                colorCardLearn[1] = const Color(0xffDC143C);
              } else {
                colorCardLearn[1] = const Color(0xff00FA9A);
                next();
              }
            }),
            child: buildCard(
              height: height,
              rep: repNum[index]["rep2"],
              trueRep: trueRep,
              cardColor: colorCardLearn[1],
            ),
          ),
          SizedBox(
            height: height / 70,
          ),
          GestureDetector(
            onTap: () => setState(() {
              if (repNum[index]["rep3"] != trueRep) {
                colorCardLearn[2] = const Color(0xffDC143C);
              } else {
                colorCardLearn[2] = const Color(0xff00FA9A);
                next();
              }
            }),
            child: buildCard(
              height: height,
              rep: repNum[index]["rep3"],
              trueRep: trueRep,
              cardColor: colorCardLearn[2],
            ),
          ),
        ],
      ),
    );
  }

  _setTimer() {
    Timer(const Duration(milliseconds: 500), () {
      setState(() {
        _pageController.animateToPage(
          isPage + 1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.linear,
        );

        colorCardLearn[0] = const Color(0xffbbbbbb);
        colorCardLearn[1] = const Color(0xffbbbbbb);
        colorCardLearn[2] = const Color(0xffbbbbbb);
      });
    });
  }
}
