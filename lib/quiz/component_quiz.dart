import 'package:learn_bantu/exports/components_quiz_export.dart';

AppBar buildBarScore({
  required double height,
  required BuildContext context,
}) =>
    AppBar(
      toolbarHeight: height / 15,
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: EdgeInsets.only(
          top: height / 70,
          left: height / 50,
        ),
        child: GestureDetector(
          onTap: () {
            QuestionController().goBackPage();
            Navigator.pop(context);
          },
          child: Icon(
            BootstrapIcons.arrow_left,
            size: height / 25,
            color: const Color(0xffffffff),
          ),
        ),
      ),
    );

AppBar buildBarQuiz({
  required double height,
  required BuildContext context,
}) =>
    AppBar(
      toolbarHeight: height / 15,
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: EdgeInsets.only(
          top: height / 70,
          left: height / 50,
        ),
        child: GestureDetector(
          onTap: () {
            QuestionController().goBackPage();
          },
          child: Icon(
            BootstrapIcons.arrow_left,
            size: height / 25,
            color: const Color(0xffffffff),
          ),
        ),
      ),
    );

Widget progressBar({
  required double width,
  required double height,
}) =>
    Container(
      width: width,
      height: height / 22.5,
      padding: EdgeInsets.all(height / 700),
      decoration: decoCont(
        height: height,
        borderColor: const Color(0xff777777),
        size: 36,
      ),
      child: GetBuilder<QuestionController>(
          init: QuestionController(),
          builder: (controller) {
            return Stack(
              children: [
                LayoutBuilder(
                  builder: (context, constraint) => Container(
                    width: constraint.maxWidth * controller.animation.value,
                    decoration: bgGradient(
                      color1: const Color(0xff3a7589),
                      color2: const Color(0xff154e62),
                      height: height,
                      size: 36,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: height / 90,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${(controller.animation.value * 30).round()} sec",
                          style: textPoppins(
                            color: const Color(0xffffffff),
                            weight: FontWeight.w500,
                            size: height / 45,
                          ),
                        ),
                        Icon(
                          BootstrapIcons.stopwatch,
                          size: height / 35,
                          color: const Color(0xffffffff),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );

Widget option({
  required double height,
  required String text,
  required int index,
  required VoidCallback press,
}) =>
    GetBuilder<QuestionController>(
      init: QuestionController(),
      builder: (qnController) {
        Color getTheColor() {
          if (qnController.isAnswered) {
            if (index == qnController.correctAns) {
              return const Color(0xff34d45a);
            } else if (index == qnController.selectedAns &&
                qnController.selectedAns != qnController.correctAns) {
              return const Color(0xffff3333);
            }
          }
          return const Color(0xffffffff);
        }

        IconData getTheIcon() {
          return getTheColor() == const Color(0xff34d45a)
              ? BootstrapIcons.check
              : BootstrapIcons.x;
        }

        return InkWell(
          onTap: press,
          child: Container(
            margin: EdgeInsets.only(
              top: height / 50,
            ),
            padding: EdgeInsets.all(
              height / 45,
            ),
            decoration: decoCont(
              height: height,
              borderColor: getTheColor(),
              size: 150,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      "${index + 1}. ",
                      style: textPoppins(
                        color: getTheColor(),
                        weight: FontWeight.w500,
                        size: height / 45,
                      ),
                    ),
                    SizedBox(
                      width: height / 2.75,
                      child: Text(
                        text,
                        style: textPoppins(
                          color: getTheColor(),
                          weight: FontWeight.w500,
                          size: height / 50,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: height / 25,
                  height: height / 25,
                  alignment: Alignment.center,
                  decoration: decoCont(
                    height: height,
                    color: getTheColor() == const Color(0xffffffff)
                        ? Colors.transparent
                        : getTheColor(),
                    borderColor: getTheColor(),
                    size: 25,
                  ),
                  child: getTheColor() == const Color(0xffffffff)
                      ? null
                      : Icon(
                          getTheIcon(),
                          size: height / 30,
                          color: const Color(0xffffffff),
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );

Widget quizCard({
  required double height,
  required Question question,
}) {
  QuestionController _controller = Get.put(QuestionController());
  return Container(
    margin: EdgeInsets.symmetric(
      horizontal: height / 30,
    ),
    child: Column(
      children: [
        Text(
          question.question,
          style: textUbuntu(
            color: const Color(0xffffffff),
            weight: FontWeight.w500,
            size: height / 35,
          ),
        ),
        ...List.generate(
          question.options.length,
          (index) => option(
            height: height,
            index: index,
            text: question.options[index],
            press: () => _controller.checkAns(question, index),
          ),
        ),
      ],
    ),
  );
}
