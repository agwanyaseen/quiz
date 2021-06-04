import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:quiz_shared/src/model/quiz_name.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';


Future<List<QuizName>> getQuiz() async {
  final response = await http.get(Uri.parse('$baseUrl/quiz'));
  var quizNames = <QuizName>[];
  if(response.statusCode==200){
    var jsonResponse = jsonDecode(response.body);
    var listQuiz= jsonResponse as List;

    listQuiz.forEach((element) { 
      var quizName = element['name'];
      var quizId = element['id'] as int;
      var quiz = QuizName(quizName,quizId);
      quizNames.add(quiz);
    }); 
  }
  return quizNames;
}

Future<Either<String, int>> addQuiz(String quizName) async {
  var response = await http.post(Uri.parse('$baseUrl/quiz/?quizName=$quizName'));

  var jsonResponse = jsonDecode(response.body) as Map;
  if(response.statusCode == 200){
    return Right(jsonResponse['id'] as int);
  }
  return Left(jsonResponse['error'] as String);
}

Future<Either<String,bool>> removeQuiz(int id)  async {
  var response = await http.delete(Uri.parse('$baseUrl/quiz/$id'));

  if(response.statusCode==200){
    return Right(true);
  }
  return Left((jsonDecode(response.body) as Map)['error']);

}