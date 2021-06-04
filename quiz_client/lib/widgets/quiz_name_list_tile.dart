import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_client/providers/quiz_data_provider.dart';
import 'package:quiz_client/screens/quiz_questions.dart';
import 'package:quiz_client/services/quiz_services.dart';
import 'package:quiz_shared/src/model/quiz_name.dart';

// ignore: must_be_immutable
class QuizNameListTile extends StatelessWidget {
  final QuizName _quizName;
  QuizNameListTile(this._quizName);
  late QuizDataProvider _quizDataProvider;

  void _onDeletePressed(int id) async {
    print('Delete Quiz $id');
    final response = await removeQuiz(id);

    response.fold((l) => null, (r) => _quizDataProvider.removeQuiz(id));
  }

  void _onQuizTilePressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => QuizQuestionView(
          quizId: _quizName.id,
          quizName: _quizName.quizName,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _quizDataProvider = Provider.of<QuizDataProvider>(context, listen: false);
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
            onPressed: () => _onDeletePressed(_quizName.id),
          ),
          contentPadding: const EdgeInsets.all(10),
          title: Text(
            _quizName.quizName,
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          onTap: () => _onQuizTilePressed(context)),
    );
  }
}
