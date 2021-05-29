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

 QuizName fromJson(Map<String,dynamic> quizResponse){
    return QuizName(quizResponse['name'],int.parse(quizResponse['id']));
  }
}