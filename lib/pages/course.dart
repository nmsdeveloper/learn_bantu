import 'package:learn_bantu/exports/learn_course_export.dart';

class Course extends StatefulWidget {
  final List listLearn;
  final String head;
  // ignore: prefer_typing_uninitialized_variables
  final size;
  const Course({
    Key? key,
    required this.listLearn,
    required this.head,
    this.size,
  }) : super(key: key);

  @override
  _CourseState createState() => _CourseState();
}

class _CourseState extends State<Course> {
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
            itemCount: widget.listLearn.length,
            itemBuilder: (context, index) {
              return buildReadAndExample(
                width: _width,
                height: _height,
                size: widget.size,
                head: widget.head,
                image: widget.listLearn[index]['image'],
                name: widget.listLearn[index]['name'],
                translate: widget.listLearn[index]['translate'],
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
            listLenght: widget.listLearn.length,
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
