class QuizName  {
  int id;
  String quizName;

  QuizName(this.quizName, this.id);

  Map toJson(){
    return {
      'name':quizName,
      'id':id
    };
  }

 QuizName.fromJson(Map quizResponse) : quizName= quizResponse['name'],id = quizResponse['id'] as int;
}