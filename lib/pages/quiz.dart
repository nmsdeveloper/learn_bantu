import 'package:learn_bantu/exports/quiz_export.dart';

class QuizPage extends StatelessWidget {
  final int id;
  const QuizPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    QuestionController _questionController =
        Get.put(QuestionController(id: id));

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildBarQuiz(height: _height, context: context),
      body: Stack(
        children: [
          Container(
            width: _width,
            height: _height,
            decoration: bgGradient(
              color1: const Color(0xff383f5b),
              color2: const Color(0xff252c49),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: _height / 40,
                    vertical: _height / 40,
                  ),
                  child: progressBar(width: _width, height: _height),
                ),
                SizedBox(
                  height: _height / 70,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: _height / 40,
                  ),
                  child: Obx(
                    () => Text.rich(
                      TextSpan(
                        text:
                            "Question ${_questionController.questionNumber.value} ",
                        style: textPoppins(
                          color: const Color(0xffaaaaaa),
                          weight: FontWeight.bold,
                          size: _height / 20,
                        ),
                        children: [
                          TextSpan(
                            text: "/ ${ListQuestion().questions[id].length}",
                            style: textPoppins(
                              color: const Color(0xffaaaaaa),
                              weight: FontWeight.bold,
                              size: _height / 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: _height / 40,
                ),
                Expanded(
                  child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _questionController.pageController,
                    onPageChanged: _questionController.updateTheQnNum,
                    itemCount: ListQuestion().questions[id].length,
                    itemBuilder: (context, index) => quizCard(
                      height: _height,
                      question: ListQuestion().questions[id][index],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StateWidgetless {}
