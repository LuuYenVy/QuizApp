import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class screen_start extends StatelessWidget {
  const screen_start(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Colors.purple,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset(
              //   "assets/images/quiz-logo.png",
              //   width: 250,
              //   color: Colors.blue,
              // ),

              Opacity(
                opacity: 0.5,
                child: Image.asset(
                  "assets/images/quiz-logo.png",
                  width: 250,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Learn Flutter the fun way!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 40),
              OutlinedButton.icon(
                  onPressed: startQuiz,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                  ),
                  icon: const Icon(Icons.arrow_right_alt),
                  label: const Text('Start Quizz'))
            ],
          ),
        ));
  }
}
