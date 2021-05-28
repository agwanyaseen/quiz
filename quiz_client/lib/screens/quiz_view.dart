import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz_shared/src/model/quiz_name.dart';

class QuizView extends StatelessWidget {
  final TextEditingController _quizNamecontroller = TextEditingController();
  
    void _handleNewQuizNamePressed() async {
      var quizName = _quizNamecontroller.text;
      int id;
      await addQuestions(quizName).then((value) {
        //Provider to add data;
      });
  }
  
  void _openCreateQuizDialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: _quizNamecontroller,
        ),
        actions: [
          ElevatedButton(
              onPressed: _handleNewQuizNamePressed, child: Text('Add'))
        ],
        title: Text('New Quiz'),
      ),

      
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Manager'),
      ),
      body: FutureBuilder<List<QuizName>>(
        future: getQuestions(),
        builder: (context, quizSnapshot) {
          if (quizSnapshot.hasError) {
            //Show SnackBar or Dialog Box;
          }
          if (quizSnapshot.hasData) {
            return QuizList(quizSnapshot.data ?? <QuizName>[]);
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
        itemCount: 10);
  }
}


class QuizNameListTile extends StatelessWidget {
  final QuizName _quizName;
  QuizNameListTile(this._quizName);
  void _onDeletePressed(int id){

  }

  void _onQuizTilePressed(){

  }
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      type: MaterialType.card,
      shadowColor: Colors.grey,
      child: ListTile(
          trailing: IconButton(
            icon: Icon(
              Icons.delete,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: ()=>_onDeletePressed(_quizName.id),
          ),
          contentPadding: const EdgeInsets.all(10),
          title: Text(
            _quizName.quizName,
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          onTap: _onQuizTilePressed),
    );
  }
}
//Mock asynchrounous/Api code, Replace with real APi calls in Future  

Future<List<QuizName>> getQuestions() {
  List<QuizName> quiz =
      List.generate(100, (index) => QuizName('Quiz Name: $index', index));
  return Future.delayed(Duration(seconds: 2), () => quiz);
}


Future<int> addQuestions(String name){
  int randomId = Random().nextInt(500);
  return Future.delayed(Duration(seconds:2),()=>randomId);  
}

Future<void> removeQuestions(int id){
  return Future.delayed(Duration(seconds:2),()=>print('Removed'));  
}
