import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_client/providers/quiz_data_provider.dart';
import 'package:quiz_client/services/quiz_services.dart';

class NewQuizNameDialog extends StatefulWidget {
  @override
  _NewQuizNameDialogState createState() => _NewQuizNameDialogState();
}

class _NewQuizNameDialogState extends State<NewQuizNameDialog> {
  final TextEditingController _quizNamecontroller = TextEditingController();
  late QuizDataProvider quizDataProvider;
  String? _errorText=null; 
  bool isAdding = false;
  void _handleNewQuizNamePressed() async {
      setState(()=>isAdding=true);
      var quizName = _quizNamecontroller.text;
      var newQuizName = await addQuiz(quizName);

      newQuizName.fold((error) => null, (id) {
        Navigator.of(context).pop();
        quizDataProvider.addQuiz(quizName, id);
      });  
  }

  @override
  Widget build(BuildContext context) {
    quizDataProvider = Provider.of<QuizDataProvider>(context,listen:false);
    return AlertDialog(
        content: TextField(
          controller: _quizNamecontroller,
          decoration: InputDecoration(
            errorText:_errorText, 
            ),
        ),
        actions: [
          ElevatedButton(
              
              onPressed: _handleNewQuizNamePressed, child: isAdding?CircularProgressIndicator():Text('Add'))
        ],
        title: Text('New Quiz'),
      );
  }
}