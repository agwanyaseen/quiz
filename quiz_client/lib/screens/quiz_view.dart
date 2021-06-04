import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz_client/services/quiz_services.dart';
import 'package:quiz_client/widgets/quiz_list.dart';
import 'package:quiz_shared/src/model/quiz_name.dart';

class QuizView extends StatelessWidget {
  
  void _openCreateQuizDialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => NewQuizNameDialog(),
    );
  }

  
  @override
  Widget build(BuildContext context) {
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
            return data.length>0?QuizList(data):Center(child: Text('No Quiz Found'));
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






//Mock asynchrounous/Api code, Replace with real APi calls in Future  

Future<int> addQuestions(String name){
  int randomId = Random().nextInt(500);
  return Future.delayed(Duration(seconds:2),()=>randomId);  
}

Future<void> removeQuestions(int id){
  return Future.delayed(Duration(seconds:2),()=>print('Removed'));  
}


class NewQuizNameDialog extends StatefulWidget {
  @override
  _NewQuizNameDialogState createState() => _NewQuizNameDialogState();
}

class _NewQuizNameDialogState extends State<NewQuizNameDialog> {
  final TextEditingController _quizNamecontroller = TextEditingController();

  String? _errorText=null; 

  void _handleNewQuizNamePressed() async {
    
      var quizName = _quizNamecontroller.text;
      int quizId = 0;
      await addQuiz(quizName).then((value) {
        value.fold((error) {
          setState(() {
            _errorText = error;
          });
        }, (id)  {
          setState(()=>_errorText=null);
          quizId = id;
          //Add To Provider 
          //Navigate to Build Quiz Question Page
          Navigator.pop(context);
          
        });
      }).then((value) => null);

      print(quizId);
  }

  @override
  Widget build(BuildContext context) {
    
    return AlertDialog(
      
        content: TextField(
          controller: _quizNamecontroller,
          decoration: InputDecoration(
            errorText:_errorText, 
            ),
        ),
        actions: [
          ElevatedButton(
              onPressed: _handleNewQuizNamePressed, child: Text('Add'))
        ],
        title: Text('New Quiz'),
      );
  }
}