import 'package:flutter/material.dart';

class QuizView extends StatelessWidget {
  final TextEditingController _quizNamecontroller = TextEditingController();
  void _onDeletePressed() {
    //Delete Logic
  }

  void _onQuizNamePressed() {
    //Navigate to Quiz Question page
  }

  void _handleNewQuizNamePressed() {

    var quizName = _quizNamecontroller.text;

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

  Widget _buildQuizNameListTile(BuildContext context) {
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
            onPressed: _onDeletePressed,
          ),
          contentPadding: const EdgeInsets.all(10),
          title: Text(
            'Quiz Name',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          hoverColor: Colors.red,
          onTap: _onQuizNamePressed),
    );
  }

  Widget _buildQuizList(List<QuizName> quiz) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return _buildQuizNameListTile(context);
        },
        separatorBuilder: (context, intdex) {
          return SizedBox(height: 8);
        },
        itemCount: 10);
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
            return _buildQuizList(quizSnapshot.data ?? <QuizName>[]);
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

Future<List<QuizName>> getQuestions() {
  List<QuizName> quiz =
      List.generate(100, (index) => QuizName('Quiza Name: $index', index));
  return Future.delayed(Duration(seconds: 2), () => quiz);
}

class QuizName {
  String quiz;
  int id;

  QuizName(this.quiz, this.id);
}
