import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:andre/introduction/login.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Title of first page",
          body: "Here you can write the description of the page, to explain someting..",
          image: Center(
            child: Container(
              width: 350,
              height: 350,
              child: Lottie.asset(
                  "assets/lotties/pp.json",
              fit: BoxFit.contain
              ),
            ),
          ),
        ),
        PageViewModel(
          title: "Title of second page",
          body: "Here you can write the description of the page, to explain someting..",
          image: Center(
            child: Container(
              width: 350,
              height: 350,
              child: Lottie.asset(
                  "assets/lotties/login.json",
                  fit: BoxFit.contain
              ),
            ),
          ),
        ),
      ],
      done: const Text("Login", style: TextStyle(fontWeight: FontWeight.w500),),
      showNextButton: true,
      next: Text("Next >>"),
      onDone: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => LoginPage(),
            ),
        );
      },
    );
  }
}