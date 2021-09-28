import 'package:learn_bantu/exports/components_export.dart';
import 'package:learn_bantu/exports/components_quiz_export.dart';
import 'package:learn_bantu/exports/examole_phrasing_export.dart';
import 'package:learn_bantu/exports/home_export.dart';
import 'package:learn_bantu/exports/learn_course_export.dart';

class DetailCoursePage extends StatelessWidget {
  final bool display;
  final String title;
  final List image;
  final Function goToReadCourse;
  // ignore: prefer_typing_uninitialized_variables
  final goToExampleCourse;
  final Function goToQuiz;
  DetailCoursePage({
    Key? key,
    required this.display,
    required this.title,
    required this.image,
    required this.goToReadCourse,
    this.goToExampleCourse,
    required this.goToQuiz,
  }) : super(key: key);

  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: _width,
            height: _height,
            decoration: bgGradient(
              color1: const Color(0xff3a7589),
              color2: const Color(0xff154e62),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: _height / 40,
                vertical: _height / 35,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => _pageController.animateToPage(
                          0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear,
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: _height / 50,
                          ),
                          alignment: Alignment.center,
                          width: _height / 6,
                          decoration: contBox(
                              height: _height,
                              color: const Color(0xffffffff),
                              size: 100),
                          child: Text(
                            "Cours",
                            style: textPoppins(
                              color: const Color(0xffbbbbbb),
                              weight: FontWeight.bold,
                              size: _height / 40,
                            ),
                          ),
                        ),
                      ),
                      display
                          ? GestureDetector(
                              onTap: () => _pageController.animateToPage(
                                1,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.linear,
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: _height / 50,
                                ),
                                alignment: Alignment.center,
                                width: _height / 6,
                                decoration: contBox(
                                    height: _height,
                                    color: const Color(0xffffffff),
                                    size: 100),
                                child: Text(
                                  "Exemple",
                                  style: textPoppins(
                                    color: const Color(0xffbbbbbb),
                                    weight: FontWeight.bold,
                                    size: _height / 40,
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                      GestureDetector(
                        onTap: () => _pageController.animateToPage(
                          2,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear,
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: _height / 50,
                          ),
                          alignment: Alignment.center,
                          width: _height / 6,
                          decoration: contBox(
                              height: _height,
                              color: const Color(0xffffffff),
                              size: 100),
                          child: Text(
                            "Quiz",
                            style: textPoppins(
                              color: const Color(0xffbbbbbb),
                              weight: FontWeight.bold,
                              size: _height / 40,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: _height / 50,
                  ),
                  SizedBox(
                    height: _height / 1.75,
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      children: [
                        buildCardDetail(
                          width: _width,
                          height: _height,
                          goTo: goToReadCourse,
                          image: image[0],
                          intro: "Vous aurez des exemples de phrase avec les "
                              "differents aliments vue dans ce cours.",
                          title: 'Cours Ecrit',
                        ),
                        display
                            ? buildCardDetail(
                                width: _width,
                                height: _height,
                                goTo: goToExampleCourse,
                                image: image[2],
                                intro:
                                    "Vous aurez des exemples de phrase avec les "
                                    "differents aliments vue dans ce cours.",
                                title: 'Exemple de phrase',
                              )
                            : Container(),
                        buildCardDetail(
                          width: _width,
                          height: _height,
                          goTo: goToQuiz,
                          image: image[3],
                          intro: "Vous aurez des exemples de phrase avec les "
                              "differents aliments vue dans ce cours.",
                          title: 'Quiz',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          buildDetailBar(
            height: _height,
            context: context,
            title: title,
          ),
        ],
      ),
    );
  }
}
