import 'package:flutter/material.dart';

class QuizQuestionView extends StatelessWidget {
  final int quizId;
  final String quizName; 
  const QuizQuestionView({required this.quizId, required this.quizName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(quizName),),
      body: ListView.separated(itemBuilder: (ctx,index)=>Text(index.toString()), separatorBuilder: (_,__)=> SizedBox(height: 8), itemCount: 10)
    );
  }
}