import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:learn_bantu/learns/learn_number.dart';
import 'package:learn_bantu/learns/learn_object.dart';
import 'package:learn_bantu/learns/learn_pronoun.dart';
import 'package:learn_bantu/learns/learrn_aliment.dart';
import 'package:learn_bantu/variables/style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: _height / 40,
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
                Text(
                  "Cours",
                  style: textUbuntu(
                    color: const Color(0xffffffff),
                    weight: FontWeight.bold,
                    size: _height / 25,
                  ),
                ),
                SizedBox(
                  height: _height / 20,
                ),
                /*=============== APPRENDRE A COMPTER ===============*/
                _buildContainer(
                  _width,
                  _height,
                  "assets/images/1.jpg",
                  const Color(0xffff9966),
                  const Color(0xffff5e62),
                  const Color(0xffeeeeee),
                  "Apprendre a Compter",
                  BootstrapIcons.chevron_right,
                  () => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LearnNumber(),
                      ),
                      (route) => false),
                ),
                /*=============== APPRENDRE A COMPTER ===============*/

                SizedBox(
                  height: _height / 20,
                ),
                /*=============== LES OBJETS ===============*/
                _buildContainer(
                  _width,
                  _height,
                  "assets/images/2.jpg",
                  const Color(0xffffafbd),
                  const Color(0xffffc3a0),
                  const Color(0xffeeeeee),
                  "Quelques objets",
                  BootstrapIcons.chevron_right,
                  () => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LearnObject(),
                      ),
                      (route) => false),
                ),
                /*=============== LES OBJETS ===============*/

                SizedBox(
                  height: _height / 20,
                ),
                /*=============== ALIMENTATIONS ===============*/
                _buildContainer(
                  _width,
                  _height,
                  "assets/images/3.jpg",
                  const Color(0xff2193b0),
                  const Color(0xff6dd5ed),
                  const Color(0xffeeeeee),
                  "Quelques aliments",
                  BootstrapIcons.chevron_right,
                  () => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LearnAliment(),
                      ),
                      (route) => false),
                ),
                /*=============== ALIMENTATIONS ===============*/

                SizedBox(
                  height: _height / 20,
                ),
                /*=============== PRONOMS PERSONNELS ===============*/
                _buildContainer(
                  _width,
                  _height,
                  "assets/images/3.jpg",
                  const Color(0xff10f2b2),
                  const Color(0xff1d976c),
                  const Color(0xffeeeeee),
                  "Pronoms Personnels",
                  BootstrapIcons.chevron_right,
                  () => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LearnPronoun(),
                      ),
                      (route) => false),
                ),
                /*=============== APPRENDRE QUELQUES ALIMENTS ===============*/

                SizedBox(
                  height: _height / 20,
                ),
                /*=============== CONVERSATION FAMILIALE ===============*/
                _buildContainer(
                    _width,
                    _height,
                    "assets/images/4.jpg",
                    const Color(0xffaa076b),
                    const Color(0xff61045f),
                    const Color(0xffeeeeee),
                    "Conversation familiale",
                    BootstrapIcons.chevron_right,
                    () {}),
                /*=============== CONVERSATION DE FAMILIALE ===============*/

                SizedBox(
                  height: _height / 20,
                ),
                /*=============== CONVERSATION SALUTATION ===============*/
                _buildContainer(
                    _width,
                    _height,
                    "assets/images/5.jpg",
                    const Color(0xff42275a),
                    const Color(0xff734b6d),
                    const Color(0xffeeeeee),
                    "Salutation",
                    BootstrapIcons.chevron_right,
                    () {}),
                /*=============== CONVERSATION SALUTATION ===============*/

                SizedBox(
                  height: _height / 20,
                ),
                /*=============== FAIRE CONNAISSANCE ===============*/
                _buildContainer(
                    _width,
                    _height,
                    "assets/images/6.jpg",
                    const Color(0xff141e30),
                    const Color(0xff243b55),
                    const Color(0xffeeeeee),
                    "Faire connaissance",
                    BootstrapIcons.chevron_right,
                    () {}),
                /*=============== FAIRE CONNAISSANCE ===============*/
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContainer(
    double _width,
    double _size,
    String _assets,
    Color _gradient1,
    Color _gradient2,
    Color _color,
    String _text,
    IconData _icon,
    Function _action,
  ) =>
      GestureDetector(
        onTap: () => _action(),
        child: Container(
          width: _width,
          height: _size / 10,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(_assets),
                fit: BoxFit.cover,
                alignment: Alignment.center),
            borderRadius: BorderRadius.circular(
              _size / 75,
            ),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: _size / 150,
            ),
            width: _width,
            height: _size / 10,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  _gradient1.withOpacity(.6),
                  _gradient2.withOpacity(.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(
                _size / 75,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  _text,
                  style: textPoppins(
                    color: _color,
                    weight: FontWeight.bold,
                    size: _size / 40,
                  ),
                ),
                Icon(
                  _icon,
                  color: _color,
                  size: _size / 30,
                ),
              ],
            ),
          ),
        ),
      );
}
