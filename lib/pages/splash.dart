import 'package:learn_bantu/exports/splash_export.dart';

class SplashLogo extends StatefulWidget {
  const SplashLogo({Key? key}) : super(key: key);

  @override
  _SplashLogoState createState() => _SplashLogoState();
}

class _SplashLogoState extends State<SplashLogo> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const StartPage(),
          ),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Container(
        width: _width,
        height: _height,
        decoration: bgGradient(
          color1: const Color(0xff36d1dc),
          color2: const Color(0xff5b86e5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Bantu",
              style: textUbuntu(
                color: const Color(0xffffffff),
                weight: FontWeight.bold,
                size: _height / 10,
              ),
            ),
            SizedBox(
              height: _height / 40,
            ),
            SpinKitPulse(
              color: const Color(0xff111111),
              size: _height / 20,
              duration: const Duration(seconds: 2),
            ),
          ],
        ),
      ),
    );
  }
}
