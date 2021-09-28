import 'package:learn_bantu/exports/question_controller_export.dart';

class Question {
  final String question;
  final List<String> options;
  final int answer;

  Question({
    required this.question,
    required this.options,
    required this.answer,
  });
}

class ListQuestion {
  final List _questions = [
    quizAli
        .map(
          (question) => Question(
              question: question['question'],
              options: question['options'],
              answer: question['answer']),
        )
        .toList(),
    quizObject
        .map(
          (question) => Question(
              question: question['question'],
              options: question['options'],
              answer: question['answer']),
        )
        .toList(),
  ];

  List get questions => _questions;
}

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  // ignore: prefer_typing_uninitialized_variables
  final id;
  QuestionController({
    this.id,
  });
  late AnimationController _animationController;

  late Animation _animation;
  Animation get animation => _animation;

  late PageController _pageController;
  PageController get pageController => _pageController;

  bool _isAnswered = false;
  bool get isAnswered => _isAnswered;

  late int _correctAns;
  int get correctAns => _correctAns;

  late int _selectedAns;
  int get selectedAns => _selectedAns;

  final RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => _numOfCorrectAns;

  @override
  void onInit() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 30),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(
        () {
          update();
        },
      );

    _animationController.forward().whenComplete(
          nextQuestion,
        );

    _pageController = PageController();

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) _numOfCorrectAns++;

    _animationController.stop();
    update();

    Future.delayed(const Duration(milliseconds: 500), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != ListQuestion()._questions[id].length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: const Duration(milliseconds: 200), curve: Curves.ease);

      _animationController.reset();

      _animationController.forward().whenComplete(nextQuestion);
    } else {
      Get.to(ScoreScreen(
        id: id,
      ));
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }

  void goToPage() {
    Get.to(QuizPage(id: id));
  }

  void goBackPage() {
    QuestionController(id: id).refresh();
    Get.back();
  }
}
