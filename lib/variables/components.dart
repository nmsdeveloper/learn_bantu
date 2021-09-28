import 'dart:ui';
import 'package:learn_bantu/exports/components_export.dart';
import 'package:learn_bantu/exports/components_quiz_export.dart';
import 'package:learn_bantu/exports/examole_phrasing_export.dart';

/*=============== CONTAINER HOME COMPONENTS ===============*/
Widget buildContainer({
  required double width,
  required double height,
  required String assets,
  required Color gradient1,
  required Color gradient2,
  required Color color,
  required String text,
  required IconData icon,
  required Function action,
}) =>
    GestureDetector(
      onTap: () => action(),
      child: Container(
        width: width,
        height: height / 10,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(assets),
              fit: BoxFit.cover,
              alignment: Alignment.center),
          borderRadius: BorderRadius.circular(
            height / 75,
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: height / 150,
          ),
          width: width,
          height: height / 10,
          decoration: bgGradient(
            height: height,
            size: 75,
            color1: gradient1.withOpacity(.6),
            color2: gradient2.withOpacity(.9),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
                style: textPoppins(
                  color: color,
                  weight: FontWeight.bold,
                  size: height / 40,
                ),
              ),
              Icon(
                icon,
                color: color,
                size: height / 30,
              ),
            ],
          ),
        ),
      ),
    );
/*=============== CONTAINER HOME COMPONENTS ===============*/

/*=============== CARD DETAIL COURSE ===============*/
Widget buildCardDetail({
  required double width,
  required double height,
  required Function goTo,
  required String image,
  required String intro,
  required String title,
}) =>
    GestureDetector(
      onTap: () => goTo(),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: height / 30,
          vertical: height / 40,
        ),
        width: width,
        height: height / 6.25,
        decoration: decoCont(
          height: height,
          color: const Color(0xff3a7589),
          borderColor: const Color(0xffdddddd),
          size: 75,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              width: height / 4,
              height: height / 4,
            ),
            Text(
              intro,
              textAlign: TextAlign.center,
              style: textUbuntu(
                color: const Color(0xffffffff),
                weight: FontWeight.w500,
                size: height / 40,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: height / 50,
                vertical: height / 40,
              ),
              width: height / 2.75,
              decoration: contBox(
                height: height,
                color: const Color(0xffeeeeee),
                size: 100,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: textPoppins(
                      color: const Color(0xff111111),
                      weight: FontWeight.w500,
                      size: height / 35,
                    ),
                  ),
                  Icon(
                    BootstrapIcons.chevron_right,
                    size: height / 30,
                    color: const Color(0xff111111),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
/*=============== CARD DETAIL COURSE ===============*/

/*=============== BAR COMPONENTS ===============*/
Widget buildDetailBar({
  required double height,
  required BuildContext context,
  required String title,
}) =>
    Padding(
      padding: EdgeInsets.symmetric(
        horizontal: height / 40,
        vertical: height / 25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              BootstrapIcons.chevron_left,
              size: height / 25,
              color: const Color(0xffffffff),
            ),
          ),
          Text(
            title,
            style: textUbuntu(
              color: const Color(0xffeeeeee),
              weight: FontWeight.w700,
              size: height / 30,
            ),
          ),
        ],
      ),
    );

buildBarPop({
  required double height,
  required BuildContext context,
}) =>
    Padding(
      padding: EdgeInsets.symmetric(
        horizontal: height / 40,
        vertical: height / 50,
      ),
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          padding: EdgeInsets.all(height / 50),
          decoration: contBox(
            height: height,
            size: 15,
            color: const Color(0xff111111).withOpacity(0.4),
          ),
          child: Icon(
            BootstrapIcons.chevron_left,
            size: height / 25,
            color: const Color(0xffffffff),
          ),
        ),
      ),
    );

buildBarText({
  required double height,
  required BuildContext context,
  required Color color,
}) =>
    Padding(
      padding: EdgeInsets.only(
        top: height / 50,
        left: height / 75,
      ),
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Text(
          "Retour",
          style: textPoppins(
            color: color,
            weight: FontWeight.w500,
            size: height / 35,
          ),
        ),
      ),
    );

/*=============== BAR COMPONENTS ===============*/

/*=============== COURSE READ COMPONENT ===============*/
buildReadAndExample({
  required double width,
  required double height,
  size,
  required String head,
  required String image,
  required String name,
  required String translate,
}) {
  Widget _card;

  if (head == "text") {
    _card = Container(
      width: width,
      height: height / 2.05,
      alignment: Alignment.center,
      decoration: bgGradient(
        color1: const Color(0xff3a7589),
        color2: const Color(0xff154e62),
      ),
      child: Text(
        image,
        style: textPoppins(
          color: const Color(0xffffffff),
          weight: FontWeight.bold,
          size: height / size,
        ),
      ),
    );
  } else {
    _card = Container(
      width: width,
      height: height / 2.05,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            image,
          ),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
    );
  }

  return Stack(
    alignment: Alignment.topCenter,
    children: [
      _card,
      Padding(
        padding: EdgeInsets.only(
          top: height / 2.5,
          left: height / 40,
          right: height / 40,
        ),
        child: Column(
          children: [
            Container(
              width: width,
              margin: EdgeInsets.only(
                bottom: height / 50,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: height / 25,
                vertical: height / 40,
              ),
              decoration: bgBoxShadow(
                height: height,
                size: 50,
                color: const Color(0xffffffff),
                colorBox: const Color(0xffd3d3d3).withOpacity(0.84),
                oX: 0.0,
                oY: 10.0,
                bR: 35.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: textPoppins(
                      color: const Color(0xffbbbbbb),
                      weight: FontWeight.w500,
                      size: height / 35,
                    ),
                  ),
                  Text(
                    "en Francais",
                    style: textPoppins(
                      color: const Color(0xffbbbbbb),
                      weight: FontWeight.w500,
                      size: height / 60,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: width,
              margin: EdgeInsets.only(
                bottom: height / 50,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: height / 25,
                vertical: height / 40,
              ),
              decoration: bgBoxShadow(
                height: height,
                size: 50,
                color: const Color(0xffffffff),
                colorBox: const Color(0xffd3d3d3).withOpacity(0.84),
                oX: 0.0,
                oY: 10.0,
                bR: 35.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    translate,
                    style: textPoppins(
                      color: const Color(0xffbbbbbb),
                      weight: FontWeight.w500,
                      size: height / 35,
                    ),
                  ),
                  Text(
                    "en Pouvi",
                    style: textPoppins(
                      color: const Color(0xffbbbbbb),
                      weight: FontWeight.w500,
                      size: height / 60,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
/*=============== COURSE READ COMPONENT ===============*/

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
    decoration: contBox(
      height: height,
      color: cardColor.withOpacity(0.8),
      size: 150,
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

/*=============== INDICATOR BAR ===============*/
buildIndicators({
  required double width,
  required double height,
  required int isPage,
  required int listLenght,
  required Function prev,
  required Function next,
}) =>
    Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: height / 50,
        ),
        width: width,
        height: height / 7.5,
        decoration: bgBoxShadow(
          height: height,
          color: const Color(0xffeeeeee),
          colorBox: const Color(0xffaaaaaa).withOpacity(0.5),
          oX: 0,
          oY: -5,
          bR: 30.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => prev(),
              child: Icon(
                BootstrapIcons.arrow_left,
                size: height / 20,
                color: const Color(0xffaaaaaa),
              ),
            ),
            Row(
              children: [
                Text(
                  "${isPage + 1}",
                  style: textPoppins(
                    color: const Color(0xffaaaaaa),
                    weight: FontWeight.bold,
                    size: height / 20,
                  ),
                ),
                Text(
                  " / $listLenght",
                  style: textPoppins(
                    color: const Color(0xffaaaaaa),
                    weight: FontWeight.w700,
                    size: height / 40,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () => next(),
              child: Icon(
                BootstrapIcons.arrow_right,
                size: height / 20,
                color: const Color(0xffaaaaaa),
              ),
            ),
          ],
        ),
      ),
    ); /*=============== INDICATOR BAR ===============*/
/*=============== INDICATOR BAR ===============*/