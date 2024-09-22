import 'package:flutter/material.dart';
import 'package:quizz_app/answer_button.dart';
import 'package:quizz_app/data/question.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/question_summary.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionScreen> {
  var currenQuestionIndex = 0;
  answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      //currenQuestionIndex = currenQuestionIndex + 1;
      //currenQuestionIndex += 1;
      currenQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currenQuestionIndex];
    return Container(
      decoration: const BoxDecoration(
        color: Colors.purple,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Builder(builder: (context) {
                  return Text(
                    currentQuestion.text,
                    style: GoogleFonts.roboto(
                        color: Color.fromARGB(255, 238, 161, 216),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  );
                }),
                const SizedBox(
                  height: 30,
                ),
                ...currentQuestion.getShuffleAnswer().map((answer) {
                  return AnswerButton(
                      answerText: answer,
                      onTap: () {
                        answerQuestion(answer);
                      });
                })
              ]),
        ),
      ),
    );
  }
}
