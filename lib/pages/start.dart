import 'package:learn_bantu/exports/start_export.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: _height / 75,
          vertical: _height / 50,
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff36d1dc),
              Color(0xff5b86e5),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: _height / 35,
              ),
              child: Container(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  ),
                  child: Text(
                    "Passer",
                    style: textUbuntu(
                      color: const Color(0xffeeeeee),
                      weight: FontWeight.normal,
                      size: _height / 45,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: _height / 1.25,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                physics: const ClampingScrollPhysics(),
                onPageChanged: (val) => setState(() {
                  _currentIndex = val;
                }),
                children: [
                  _buildPage(
                    asset: "assets/boards/board1.svg",
                    text:
                        "Bienvenue sur Bantu.\nCette application vous permettra d'apprendre "
                        "le pouvi une langue ethnique du Gabon.",
                    height: _height,
                  ),
                  _buildPage(
                    asset: "assets/boards/board2.svg",
                    text: "Notez bien que les mots et "
                        "phrases sont écrits selon phonétique et "
                        "non la grammaire pour une meilleur compréhension.",
                    height: _height,
                  ),
                  _buildPage(
                    asset: "assets/boards/board3.svg",
                    text: "C'est parti, apprenons le Pouvi.",
                    height: _height,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicators(height: _height),
            ),
            _currentIndex == 2
                ? Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: _height / 50,
                        ),
                        child: GestureDetector(
                          onTap: () => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                            (route) => false,
                          ),
                          child: Text(
                            "Commencer",
                            style: textPoppins(
                              color: const Color(0xffeeeeee),
                              weight: FontWeight.bold,
                              size: _height / 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: _height / 35,
                          bottom: _height / 50,
                        ),
                        child: GestureDetector(
                          onTap: () => _pageController.animateToPage(
                            _currentIndex + 1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.linear,
                          ),
                          child: Container(
                            width: _height / 12.75,
                            height: _height / 12.75,
                            decoration: BoxDecoration(
                              color: const Color(0xff36d1dc),
                              borderRadius: BorderRadius.circular(
                                _height / 25,
                              ),
                            ),
                            child: Icon(
                              BootstrapIcons.arrow_right,
                              color: const Color(0xffeeeeee),
                              size: _height / 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  _buildPage({
    required String asset,
    required String text,
    required double height,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: height / 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SvgPicture.asset(
              asset,
              width: height / 2.25,
              height: height / 2.25,
            ),
          ),
          SizedBox(
            height: height / 25,
          ),
          Text(
            text,
            style: textPoppins(
              color: const Color(0xffeeeeee),
              weight: FontWeight.w500,
              size: height / 40,
            ),
          ),
        ],
      ),
    );
  }

  _buildIndicators({
    required double height,
  }) {
    List<Widget> list = [];
    for (int i = 0; i < 3; i++) {
      list.add(
        i == _currentIndex
            ? _indicator(
                isActive: true,
                height: height,
              )
            : _indicator(
                isActive: false,
                height: height,
              ),
      );
    }
    return list;
  }

  _indicator({
    required bool isActive,
    required double height,
  }) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 300,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: height / 150,
      ),
      width: isActive ? height / 20 : height / 60,
      height: height / 80,
      decoration: BoxDecoration(
        color: const Color(0xffeeeeee),
        borderRadius: BorderRadius.circular(
          height / 25,
        ),
      ),
    );
  }
}
