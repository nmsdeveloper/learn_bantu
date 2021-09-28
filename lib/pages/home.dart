import 'package:learn_bantu/exports/home_export.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: _height / 40,
              vertical: _height / 40,
            ),
            child: SizedBox(
              width: _width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: _height / 75,
                  ),
                  SizedBox(
                    height: _height / 20,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          BootstrapIcons.app_indicator,
                          color: const Color(0xffff5e62),
                          size: _height / 30,
                        ),
                        SizedBox(
                          width: _height / 50,
                        ),
                        Text(
                          "Apprendre le Pouvi",
                          style: textUbuntu(
                            color: const Color(0xffff5e62),
                            weight: FontWeight.bold,
                            size: _height / 27,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: _height / 20,
                  ),
                  /*=============== QUELQUES MOTS ===============*/
                  buildContainer(
                    width: _width,
                    height: _height,
                    assets: coverHome[0],
                    gradient1: const Color(0xffff9966),
                    gradient2: const Color(0xffff5e62),
                    color: const Color(0xffeeeeee),
                    text: "Quelques Mots",
                    icon: BootstrapIcons.chevron_right,
                    action: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailCoursePage(
                          display: true,
                          title: "Quelques Mots",
                          image: imageDetail,
                          goToReadCourse: () {},
                          goToExampleCourse: () {},
                          goToQuiz: () {},
                        ),
                      ),
                    ),
                  ),
                  /*=============== QUELQUES MOTS ===============*/

                  SizedBox(
                    height: _height / 20,
                  ),
                  /*=============== APPRENDRE A COMPTER ===============*/
                  buildContainer(
                    width: _width,
                    height: _height,
                    assets: coverHome[1],
                    gradient1: const Color(0xffff9966),
                    gradient2: const Color(0xffff5e62),
                    color: const Color(0xffeeeeee),
                    text: "Apprendre a Compter",
                    icon: BootstrapIcons.chevron_right,
                    action: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailCoursePage(
                          display: false,
                          title: "Apprendre a Compter",
                          image: imageDetail,
                          goToReadCourse: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Course(
                                listLearn: readNum,
                                head: 'text',
                                size: 7.5,
                              ),
                            ),
                          ),
                          goToQuiz: () {},
                        ),
                      ),
                    ),
                  ),
                  /*=============== APPRENDRE A COMPTER ===============*/

                  SizedBox(
                    height: _height / 20,
                  ),
                  /*=============== LES OBJETS ===============*/
                  buildContainer(
                    width: _width,
                    height: _height,
                    assets: coverHome[2],
                    gradient1: const Color(0xffffafbd),
                    gradient2: const Color(0xffffc3a0),
                    color: const Color(0xffeeeeee),
                    text: "Quelques objets",
                    icon: BootstrapIcons.chevron_right,
                    action: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailCoursePage(
                          display: true,
                          title: "Quelques objets",
                          image: imageDetail,
                          goToReadCourse: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Course(
                                listLearn: readObject,
                                head: 'image',
                              ),
                            ),
                          ),
                          goToExampleCourse: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ExamplePhrasing(
                                listExample: exampleObject,
                                size: 16,
                                head: 'text',
                              ),
                            ),
                          ),
                          goToQuiz: () => QuestionController(id: 1).goToPage(),
                        ),
                      ),
                    ),
                  ),
                  /*=============== LES OBJETS ===============*/

                  SizedBox(
                    height: _height / 20,
                  ),
                  /*=============== ALIMENTATIONS ===============*/
                  buildContainer(
                    width: _width,
                    height: _height,
                    assets: coverHome[3],
                    gradient1: const Color(0xff2193b0),
                    gradient2: const Color(0xff6dd5ed),
                    color: const Color(0xffeeeeee),
                    text: "Quelques aliments",
                    icon: BootstrapIcons.chevron_right,
                    action: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailCoursePage(
                          display: true,
                          title: "Quelques aliments",
                          image: imageDetail,
                          goToReadCourse: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Course(
                                listLearn: readAli,
                                head: 'image',
                              ),
                            ),
                          ),
                          goToExampleCourse: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ExamplePhrasing(
                                listExample: exampleAli,
                                size: 16,
                                head: 'text',
                              ),
                            ),
                          ),
                          goToQuiz: () => QuestionController(id: 0).goToPage(),
                        ),
                      ),
                    ),
                  ),
                  /*=============== ALIMENTATIONS ===============*/

                  SizedBox(
                    height: _height / 20,
                  ),
                  /*=============== ANIMAUX ===============*/
                  buildContainer(
                    width: _width,
                    height: _height,
                    assets: coverHome[4],
                    gradient1: const Color(0xff2193b0),
                    gradient2: const Color(0xff6dd5ed),
                    color: const Color(0xffeeeeee),
                    text: "Les Animaux",
                    icon: BootstrapIcons.chevron_right,
                    action: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailCoursePage(
                          display: true,
                          title: "Quelques Animaux",
                          image: imageDetail,
                          goToReadCourse: () {},
                          goToExampleCourse: () {},
                          goToQuiz: () {},
                        ),
                      ),
                    ),
                  ),
                  /*=============== ANIMAUX ===============*/

                  SizedBox(
                    height: _height / 20,
                  ),
                  /*=============== PRONOMS PERSONNELS ===============*/
                  buildContainer(
                    width: _width,
                    height: _height,
                    assets: coverHome[5],
                    gradient1: const Color(0xff10f2b2),
                    gradient2: const Color(0xff1d976c),
                    color: const Color(0xffeeeeee),
                    text: "Pronoms Personnels",
                    icon: BootstrapIcons.chevron_right,
                    action: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailCoursePage(
                          display: true,
                          title: "Pronoms Personnels",
                          image: imageDetail,
                          goToReadCourse: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Course(
                                listLearn: readPron,
                                head: 'image',
                              ),
                            ),
                          ),
                          goToExampleCourse: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ExamplePhrasing(
                                listExample: examplePron,
                                size: 15,
                                head: 'text',
                              ),
                            ),
                          ),
                          goToQuiz: () {},
                        ),
                      ),
                    ),
                  ),
                  /*=============== PRONOMS PERSONNELS ===============*/

                  SizedBox(
                    height: _height / 20,
                  ),
                  /*=============== CONVERSATION FAMILIALE ===============*/
                  buildContainer(
                    width: _width,
                    height: _height,
                    assets: coverHome[6],
                    gradient1: const Color(0xffaa076b),
                    gradient2: const Color(0xff61045f),
                    color: const Color(0xffeeeeee),
                    text: "Conversation familiale",
                    icon: BootstrapIcons.chevron_right,
                    action: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailCoursePage(
                          display: false,
                          title: "Conversation familiale",
                          image: imageDetail,
                          goToReadCourse: () {},
                          goToQuiz: () {},
                        ),
                      ),
                    ),
                  ),
                  /*=============== CONVERSATION DE FAMILIALE ===============*/

                  SizedBox(
                    height: _height / 20,
                  ),
                  /*=============== CONVERSATION SALUTATION ===============*/
                  buildContainer(
                    width: _width,
                    height: _height,
                    assets: coverHome[7],
                    gradient1: const Color(0xff42275a),
                    gradient2: const Color(0xff734b6d),
                    color: const Color(0xffeeeeee),
                    text: "Salutation",
                    icon: BootstrapIcons.chevron_right,
                    action: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailCoursePage(
                          display: false,
                          title: "Salutation",
                          image: imageDetail,
                          goToReadCourse: () {},
                          goToQuiz: () {},
                        ),
                      ),
                    ),
                  ),
                  /*=============== CONVERSATION SALUTATION ===============*/

                  SizedBox(
                    height: _height / 20,
                  ),
                  /*=============== FAIRE CONNAISSANCE ===============*/
                  buildContainer(
                    width: _width,
                    height: _height,
                    assets: coverHome[8],
                    gradient1: const Color(0xff141e30),
                    gradient2: const Color(0xff243b55),
                    color: const Color(0xffeeeeee),
                    text: "Faire connaissance",
                    icon: BootstrapIcons.chevron_right,
                    action: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailCoursePage(
                          display: false,
                          title: "Faire connaissance",
                          image: imageDetail,
                          goToReadCourse: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PhrasingCourse(
                                isList: getToKnow,
                              ),
                            ),
                          ),
                          goToQuiz: () {},
                        ),
                      ),
                    ),
                  ),
                  /*=============== FAIRE CONNAISSANCE ===============*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
