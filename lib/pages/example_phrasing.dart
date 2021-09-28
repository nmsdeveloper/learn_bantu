import 'package:learn_bantu/exports/examole_phrasing_export.dart';

class ExamplePhrasing extends StatefulWidget {
  final List listExample;
  final double size;
  final String head;
  const ExamplePhrasing({
    Key? key,
    required this.listExample,
    required this.size,
    required this.head,
  }) : super(key: key);

  @override
  _ExamplePhrasingState createState() => _ExamplePhrasingState();
}

class _ExamplePhrasingState extends State<ExamplePhrasing> {
  int isPage = 0;

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          PageView.builder(
            physics: const ClampingScrollPhysics(),
            controller: _pageController,
            onPageChanged: (val) => setState(() {
              isPage = val;
            }),
            scrollDirection: Axis.horizontal,
            itemCount: widget.listExample.length,
            itemBuilder: (context, index) {
              return buildReadAndExample(
                width: _width,
                height: _height,
                size: widget.size,
                head: widget.head,
                image: widget.listExample[index]['image'],
                name: widget.listExample[index]['phrasing'],
                translate: widget.listExample[index]['translate'],
              );
            },
          ),
          buildBarPop(
            height: _height,
            context: context,
          ),
          buildIndicators(
            width: _width,
            height: _height,
            isPage: isPage,
            listLenght: widget.listExample.length,
            prev: () => _pageController.animateToPage(
              isPage - 1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear,
            ),
            next: () => _pageController.animateToPage(
              isPage + 1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear,
            ),
          ),
        ],
      ),
    );
  }
}
