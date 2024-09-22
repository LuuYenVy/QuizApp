import 'package:flutter/material.dart';
import 'package:quizz_app/data/question.dart';
import 'package:quizz_app/question_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswers, required this.restart});
  final List<String> chosenAnswers;
  final void Function() restart;
  List<Map<String, Object>> getSumaryData() {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answers': questions[i].answers[0],
        'user_answers': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSumaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answers'] == data['correct_answers'];
    }).length;
    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'You answerd $numCorrectQuestions out of $numTotalQuestions question correctly!'),
              const SizedBox(
                height: 30,
              ),
              QuestionSummary(summaryData),
              const Text('List of answers and questions...'),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                  onPressed: () {
                    restart;
                  },
                  child: const Text('Restart Quiz')),
            ],
          ),
        ));
  }
}
