import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_bantu/variables/style.dart';
import 'package:learn_bantu/pages/home.dart';

/*=============== BAR COMPONENTS ===============*/
buildBar({
  required BuildContext context,
  required int isPage,
  required Function pageController,
  required double height,
}) {
  return Container(
    alignment: Alignment.centerLeft,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => isPage > 5
              ? pageController()
              : Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                  (route) => false),
          child: Padding(
            padding: EdgeInsets.only(
              top: height / 35,
              left: height / 100,
              bottom: height / 75,
            ),
            child: Icon(
              BootstrapIcons.chevron_left,
              color: const Color(0xffeeeeee),
              size: height / 27.5,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
              (route) => false),
          child: Padding(
            padding: EdgeInsets.only(
              top: height / 35,
              right: height / 100,
              bottom: height / 75,
            ),
            child: Icon(
              BootstrapIcons.x_lg,
              color: const Color(0xffeeeeee),
              size: height / 30,
            ),
          ),
        ),
      ],
    ),
  );
}
/*=============== BAR COMPONENTS ===============*/

/*=============== OBJECTS COMPONENTS ===============*/
buildObject({
  required double width,
  required double height,
  required String head,
  required String image,
  required String nom,
  required String traduction,
}) {
  Widget _card;
  if (head == "text") {
    _card = Container(
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
        image,
        textAlign: TextAlign.center,
        style: textUbuntu(
          color: const Color(0xffaaaaaa),
          weight: FontWeight.bold,
          size: height / 5,
        ),
      ),
    );
  } else {
    _card = Container(
      width: height / 2,
      height: height / 2.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          height / 75,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0xff5b86e5),
            blurRadius: 20.0,
            offset: Offset(5, 5),
          ),
        ],
        image: DecorationImage(
          image: AssetImage(
            image,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: height / 20,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height / 20,
        ),
        Center(child: _card),
        SizedBox(
          height: height / 25,
        ),
        Container(
          width: width,
          height: height / 12.5,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              height / 75,
            ),
            color: const Color(0xffaaaaaa).withOpacity(0.7),
          ),
          child: Text(
            nom,
            style: textPoppins(
              color: const Color(0xffffffff),
              weight: FontWeight.w500,
              size: height / 35,
            ),
          ),
        ),
        SizedBox(
          height: height / 25,
        ),
        Container(
          width: width,
          height: height / 12.5,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              height / 75,
            ),
            color: const Color(0xffaaaaaa).withOpacity(0.7),
          ),
          child: Text(
            traduction,
            style: textPoppins(
              color: const Color(0xffffffff),
              weight: FontWeight.w500,
              size: height / 35,
            ),
          ),
        ),
      ],
    ),
  );
}
/*=============== OBJECTS COMPONENTS ===============*/

/*=============== CARD EXERCICE ===============*/
buildCard({
  required double height,
  required String rep,
  required String trueRep,
  required Color cardColor,
}) {
  return AnimatedContainer(
    padding: EdgeInsets.symmetric(
      horizontal: height / 75,
      vertical: height / 40,
    ),
    duration: const Duration(milliseconds: 300),
    decoration: BoxDecoration(
      color: cardColor.withOpacity(0.8),
      borderRadius: BorderRadius.circular(height / 150),
    ),
    alignment: Alignment.center,
    child: Text(
      rep,
      style: textUbuntu(
        color: const Color(0xffffffff),
        weight: FontWeight.w500,
        size: height / 35,
      ),
    ),
  );
}
/*=============== CARD EXERCICE ===============*/

buildIndicators({
  required double height,
  required int isPage,
  required int isI,
  required int horiHei,
}) {
  List<Widget> list = [];
  for (int i = 0; i < isI; i++) {
    list.add(
      i == isPage
          ? indicator(
              isActive: true,
              height: height,
              horiHei: horiHei,
            )
          : indicator(
              isActive: false,
              height: height,
              horiHei: horiHei,
            ),
    );
  }
  return list;
}

indicator({
  required bool isActive,
  required double height,
  required int horiHei,
}) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    width: isActive ? height / 25 : height / 80,
    height: height / 80,
    margin: EdgeInsets.symmetric(
      horizontal: height / horiHei,
      vertical: height / 30,
    ),
    decoration: BoxDecoration(
      color: isActive
          ? const Color(0xffffffff)
          : const Color(0xffffffff).withOpacity(0.4),
      borderRadius: BorderRadius.circular(height / 25),
    ),
  );
}
