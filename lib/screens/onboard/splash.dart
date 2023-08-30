import 'dart:async';
import 'package:ar_book/screens/book_dowload/list_book_download.dart';
import 'package:ar_book/screens/daskboard/dask_board_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class Splash extends StatefulWidget {
  final bool ischeckInternet;
  const Splash({Key? key, this.ischeckInternet = false}) : super(key: key);

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    goToNextScreen();
  }

  void goToNextScreen() {
    Timer(const Duration(seconds: 3), () {
      if(widget.ischeckInternet){
         Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const ListBookDownLoad(),
        ),
      );
      }else
      Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const DaskBoardScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFDFF1EB),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Image.asset(
              'assets/images/goc.png',
              height: MediaQuery.of(context).size.width * 0.3,
              width: MediaQuery.of(context).size.width * 0.3,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/UNICEF.webp',
                  height: MediaQuery.of(context).size.width * 0.2,
                  width: MediaQuery.of(context).size.width * 0.2,
                ),
                const SizedBox(width: 16),
                Image.asset(
                  'assets/images/logo-vien-vnies2.png',
                  height: MediaQuery.of(context).size.width * 0.2,
                  width: MediaQuery.of(context).size.width * 0.2,
                ),
                const SizedBox(width: 16),
                Image.asset(
                  'assets/images/glc.jpg',
                  height: MediaQuery.of(context).size.width * 0.2,
                  width: MediaQuery.of(context).size.width * 0.2,
                ),
              ],
            ),
            const Spacer(),
            Image.asset(
              'assets/images/splash.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}
