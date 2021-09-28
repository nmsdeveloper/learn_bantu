import 'package:learn_bantu/exports/score_export.dart';

class ScoreScreen extends StatelessWidget {
  final int id;
  const ScoreScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController(id: id));
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildBarScore(height: _height, context: context),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            width: _width,
            height: _height,
            decoration: bgGradient(
              color1: const Color(0xff383f5b),
              color2: const Color(0xff252c49),
            ),
          ),
          Column(
            children: [
              const Spacer(flex: 3),
              Text(
                "Score",
                style: textPoppins(
                  color: const Color(0xffeeeeee),
                  weight: FontWeight.bold,
                  size: _height / 12,
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${((_qnController.numOfCorrectAns / ListQuestion().questions[id].length) * 100).toInt()} ",
                    style: textPoppins(
                      color: const Color(0xffeeeeee),
                      weight: FontWeight.bold,
                      size: _height / 20,
                    ),
                  ),
                  Text(
                    "/ 100",
                    style: textPoppins(
                      color: const Color(0xffeeeeee),
                      weight: FontWeight.bold,
                      size: _height / 40,
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
