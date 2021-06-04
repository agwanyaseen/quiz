import 'dart:convert';

import 'package:quiz_client/constants.dart';
import 'package:quiz_shared/src/model/quiz_question.dart';
import 'package:http/http.dart' as http;


Future<List<QuizQuestion>> getQuestions(int id) async {
  var response = await http.get(Uri.parse('$baseUrl/questions/$id'));
  if(response.statusCode != 200){
    return <QuizQuestion>[];
  }
  var mapResponse = jsonDecode(response.body) as List;
  var questions = <QuizQuestion>[];
  mapResponse.forEach((element) {
      var question = QuizQuestion.fromJson(element);
      questions.add(question);
  });
  
  return questions;
} 