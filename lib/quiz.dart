import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizz_app/question_screen.dart';
import 'package:quizz_app/screenstart.dart';
import 'package:quizz_app/question_screen.dart';
import 'package:quizz_app/data/question.dart';
import 'package:quizz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'screen_start';
  // @override
  // void initState() {
  //   activeScreen = screenstart(swichScreen);
  //   super.initState();
  // }
  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'screen_start';
    });
  }

  void swichScreen() {
    setState(() {
      // activeScreen = const QuestionScreen();
      activeScreen = 'question_screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results_screen';
      });
    }
  }

  @override
  Widget build(context) {
    // final screenWidget = activeScreen == 'screenstart'
    //     ? screenstart(swichScreen)
    //     : const QuestionScreen(onSelectAnswer: chooseAnswer,);
    Widget screenWidget = screen_start(swichScreen);
    if (activeScreen == 'question_screen') {
      screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer);
    }
    if (activeScreen == 'results_screen') {
      screenWidget =
          ResultsScreen(restart: restartQuiz, chosenAnswers: selectedAnswers);
    }
    return MaterialApp(
        home: Scaffold(
      body: Container(
        child: screenWidget,
      ),
    ));
  }
}
