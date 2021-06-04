
class QuizOption {
  int id=0;
  String option='';
  bool isCorrect=false;
  QuizOption({required this.id, required this.option, this.isCorrect= false});

  Map toJson(){
    return {
      'id': id,
      'option':option,
      'isCorrect': isCorrect
    };
  }
  QuizOption.fromJson(Map response): id = response['id'], option=response['option'], isCorrect = response['isCorrect'];
}