import 'package:flutter/material.dart';
import 'package:quiz_client/services/question_service.dart';
import 'package:quiz_client/widgets/build_question_expansion_tile.dart';
import 'package:quiz_shared/src/model/quiz_question.dart';

class QuestionView extends StatefulWidget {
  final int questionId;

  QuestionView({required this.questionId});

  @override
  _QuestionViewState createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  late Future<List<QuizQuestion>> questionsFuture;

  @override
  void initState() {
    super.initState();
    questionsFuture = getQuestions(widget.questionId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<QuizQuestion>>(
        future: questionsFuture,
        builder: (context, questionSnapShot) {
          if (questionSnapShot.hasError) {
            return Text('Error');
          }
          if (!questionSnapShot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final questions = questionSnapShot.data ?? <QuizQuestion>[];
          return Expanded(
            child: questions.length > 0
                ? ListView.separated(
                    itemBuilder: (ctx, index) => BuildQuestionExpansionTile(
                          questions[index],
                        ),
                    separatorBuilder: (_, __) => SizedBox(height: 8),
                    itemCount: questions.length)
                : Center(
                    child: Text('No Question Found'),
                  ),
          );
        });
  }
}
