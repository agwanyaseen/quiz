import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_client/providers/quiz_data_provider.dart';
import 'package:quiz_client/widgets/quiz_name_list_tile.dart';

class QuizList extends StatelessWidget {
  QuizList();
  @override
  Widget build(BuildContext context) {
    var quizNames = Provider.of<QuizDataProvider>(context).quizNames;
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