import 'package:flutter/material.dart';

import 'package:quiz_client/widgets/new_quiz_question.dart';
import 'package:quiz_client/widgets/question_view.dart';

class QuizQuestionView extends StatelessWidget {
  final int quizId;
  final String quizName;
  QuizQuestionView({this.quizId = 1, this.quizName = 'Test Quiz Name'});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(quizName),
      ),
      body: Column(
        children: [
          QuestionView(questionId: quizId),
          NewQuizQuestion(),
        ],
      ),
    );
  }
}
