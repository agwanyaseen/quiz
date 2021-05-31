import 'package:flutter/foundation.dart';
import 'package:quiz_client/providers/provider_models/quiz_options_meta_data.dart';

class QuizOptionsProvider extends ChangeNotifier  {

  List<QuizOptionsMetaData> _options = <QuizOptionsMetaData>[];
  List<QuizOptionsMetaData> get options => [..._options]; 
  QuizOptionsMetaData? get defaultOption {
    if(_options.length==0)
      return null;
    
    return options.where((element) => element.isCorrect).first;
  }
  void addNewOption(QuizOptionsMetaData options){
    _options.add(options);
    notifyListeners();
  } 

  void changeSelected(QuizOptionsMetaData option){
    _options.forEach((element) {element.isCorrect=false;});
    var newDefaultOption = _options.where((element) => element==option).first;
    newDefaultOption.isCorrect=true;
    notifyListeners();
  }


  void removeOption(QuizOptionsMetaData option){
    _options.remove(option);
    if(option.isCorrect && _options.length>0){
      _options[0].isCorrect= true;
    }
    notifyListeners();
  }

}

