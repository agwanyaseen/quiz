import 'package:flutter/material.dart';
import 'package:quiz_client/widgets/quiz_name_list_tile.dart';
import 'package:quiz_shared/src/model/quiz_name.dart';
class QuizList extends StatelessWidget {
  final List<QuizName> quizNames;
  QuizList(this.quizNames);
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return QuizNameListTile(quizNames[index]);
        },
        separatorBuilder: (context, intdex) {
          return SizedBox(height: 8);
        },
        itemCount: quizNames.length);
  }
}