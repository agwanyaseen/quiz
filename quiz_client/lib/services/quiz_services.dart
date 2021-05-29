import 'dart:convert';

import 'package:quiz_shared/src/model/quiz_name.dart';
import 'package:http/http.dart' as http;
const String _baseUrl='http://localhost:59933/api'; 

Future<List<QuizName>> getQuiz() async {
  final response = await http.get(Uri.parse('$_baseUrl/quiz'));
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

Future<bool> addQuiz(String quizName) async {
  var response = await http.post(Uri.parse('$_baseUrl/quiz/$quizName'));

  if(response.statusCode == 200){
    return true;
  }
  return false;
}