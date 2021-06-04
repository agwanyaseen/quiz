import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_client/providers/quiz_data_provider.dart';
import 'package:quiz_client/services/quiz_services.dart';
import 'package:quiz_client/widgets/new_quiz_name_dialog.dart';
import 'package:quiz_client/widgets/quiz_list.dart';
import 'package:quiz_shared/src/model/quiz_name.dart';

class QuizView extends StatelessWidget {
  
  void _openCreateQuizDialogBox(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (ctx) => ChangeNotifierProvider.value(
        value: QuizDataProvider(),
        child: NewQuizNameDialog()),
    );
  }

  
  @override
  Widget build(BuildContext context) {
    var quizDataProvider = Provider.of<QuizDataProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Manager'),
      ),
      body: FutureBuilder<List<QuizName>>(
        future: getQuiz(),
        builder: (context, quizSnapshot) {
          if (quizSnapshot.hasError) {
            //Show SnackBar or Dialog Box;
          }
          if (quizSnapshot.hasData) {
            var data = quizSnapshot.data ?? <QuizName>[];
            data.forEach((element) {quizDataProvider.addInitialData(element.quizName, element.id);});
            return data.length>0?QuizList():Center(child: Text('No Quiz Found'));
          }
          return Center(child: const CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openCreateQuizDialogBox(context),
      ),
    );
  }
}



