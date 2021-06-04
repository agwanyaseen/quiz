import 'package:flutter/material.dart';
import 'package:quiz_client/widgets/build_options_row.dart';
import 'package:quiz_shared/src/model/quiz_question.dart';

class BuildQuestionExpansionTile extends StatelessWidget {
  final QuizQuestion question;
  BuildQuestionExpansionTile(this.question);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      type: MaterialType.card,
      shadowColor: Colors.grey[400],
      child: ExpansionTile(
        title: Text('Q: ${question.question}'),
        expandedAlignment: Alignment.centerLeft,
        children: question.options.map((e) => BuildOptionsRow(option: e.option, isCorrect: e.isCorrect)).toList(),  
      ),
    );
  }
}
