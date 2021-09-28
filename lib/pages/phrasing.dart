import 'package:flutter/material.dart';
import 'package:learn_bantu/variables/components.dart';
import 'package:learn_bantu/variables/style.dart';

class PhrasingCourse extends StatefulWidget {
  final List isList;
  const PhrasingCourse({
    Key? key,
    required this.isList,
  }) : super(key: key);

  @override
  _PhrasingCourseState createState() => _PhrasingCourseState();
}

class _PhrasingCourseState extends State<PhrasingCourse> {
  final ScrollController _listController = ScrollController();

  int i = 0;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: _height / 70,
          vertical: _height / 100,
        ),
        decoration: bgGradient(
          color1: const Color(0xff383f5b),
          color2: const Color(0xff252c49),
        ),
        width: _width,
        height: _height,
        child: ListView(
          children: [
            /*=============== BAR ===============*/
            buildBarText(
              height: _height,
              context: context,
              color: const Color(0xffffffff),
            ),
            /*=============== BAR ===============*/

            SizedBox(
              height: _height / 1.20,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                controller: _listController,
                physics: const ClampingScrollPhysics(),
                itemCount: widget.isList.length,
                itemBuilder: (context, index) {
                  return (index <= i && index % 2 == 0)
                      ? _messageLeft(
                          width: _width,
                          height: _height,
                          mainAxisAlignment: MainAxisAlignment.start,
                          phrase: widget.isList[index]['phrasing'],
                          translate: widget.isList[index]['translate'])
                      : (index <= i && index % 2 != 0)
                          ? _messageRight(
                              width: _width,
                              height: _height,
                              mainAxisAlignment: MainAxisAlignment.end,
                              phrase: widget.isList[index]['phrasing'],
                              translate: widget.isList[index]['translate'],
                            )
                          : Container();
                },
              ),
            ),
            i < widget.isList.length
                ? GestureDetector(
                    onTap: () {
                      if (i < widget.isList.length) {
                        setState(() {
                          i += 1;
                          _listController.animateTo(
                            _listController.position.maxScrollExtent +
                                _height -
                                50,
                            duration: const Duration(seconds: 2),
                            curve: Curves.fastOutSlowIn,
                          );
                        });
                      }
                    },
                    child: Text(
                      "Suivant",
                      textAlign: TextAlign.right,
                      style: textPoppins(
                        color: const Color(0xffffffff),
                        weight: FontWeight.w500,
                        size: _height / 35,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  _messageLeft({
    required double width,
    required double height,
    required MainAxisAlignment mainAxisAlignment,
    required String phrase,
    required String translate,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: height / 30,
      ),
      child: SizedBox(
        width: width,
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: height / 2.25,
              padding: EdgeInsets.symmetric(
                horizontal: height / 60,
                vertical: height / 75,
              ),
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xff36d1dc).withOpacity(0.5),
                    const Color(0xff5b86e5).withOpacity(0.5),
                  ],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(height / 400),
                  topRight: Radius.circular(height / 30),
                  bottomLeft: Radius.circular(height / 30),
                  bottomRight: Radius.circular(height / 30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    phrase,
                    style: textUbuntu(
                      color: const Color(0xffffffff),
                      weight: FontWeight.w500,
                      size: height / 45,
                    ),
                  ),
                  SizedBox(
                    height: height / 80,
                  ),
                  Text(
                    translate,
                    style: textUbuntu(
                      color: const Color(0xffffffff),
                      weight: FontWeight.w500,
                      size: height / 45,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _messageRight({
    required double width,
    required double height,
    required MainAxisAlignment mainAxisAlignment,
    required String phrase,
    required String translate,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: height / 30,
      ),
      child: SizedBox(
        width: width,
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: height / 2.25,
              padding: EdgeInsets.symmetric(
                horizontal: height / 60,
                vertical: height / 75,
              ),
              alignment: Alignment.topRight,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xff36d1dc).withOpacity(0.5),
                    const Color(0xff5b86e5).withOpacity(0.5),
                  ],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(height / 30),
                  topRight: Radius.circular(height / 400),
                  bottomLeft: Radius.circular(height / 30),
                  bottomRight: Radius.circular(height / 30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    phrase,
                    style: textUbuntu(
                      color: const Color(0xffffffff),
                      weight: FontWeight.w500,
                      size: height / 45,
                    ),
                  ),
                  SizedBox(
                    height: height / 80,
                  ),
                  Text(
                    translate,
                    style: textUbuntu(
                      color: const Color(0xffffffff),
                      weight: FontWeight.w500,
                      size: height / 45,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
