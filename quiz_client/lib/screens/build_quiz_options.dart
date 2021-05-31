import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_client/providers/provider_models/quiz_options_meta_data.dart';
import 'package:quiz_client/providers/quiz_options_provider.dart';

class BuildQuizOptions extends StatefulWidget {
  @override
  _BuildQuizOptionsState createState() => _BuildQuizOptionsState();
}

class _BuildQuizOptionsState extends State<BuildQuizOptions> {
  
  late QuizOptionsProvider options;
  
  void _handleAddOptionPress(){
    var textEditingController = TextEditingController();
    options.addNewOption(QuizOptionsMetaData(textEditingController, options.options.length==0));
  }

  void _handleSaveButton(){

  }

  @override
  Widget build(BuildContext context) {
  options = Provider.of<QuizOptionsProvider>(context);
    var quizOptions = options.options;
    return Scaffold(
      body: Column(
        children: [
          Text('Question'),
          Expanded(
            child: ListView(
              children: [
                ...quizOptions.map((e) => BuildQuizOptionTile(e)),
                ElevatedButton(
                    onPressed: _handleAddOptionPress,
                    child: Text('Add new Options'),
                    style: ButtonStyle())
              ],
            ),
          ),
          ElevatedButton(onPressed: _handleSaveButton, child: Text('Save')),
        ],
      ),
    );
  }
}

class BuildQuizOptionTile extends StatefulWidget {
  final QuizOptionsMetaData _quizOptionMetaData;
  BuildQuizOptionTile(
      this._quizOptionMetaData);
  @override
  _BuildQuizOptionTileState createState() => _BuildQuizOptionTileState();
}

class _BuildQuizOptionTileState extends State<BuildQuizOptionTile> {
  late QuizOptionsProvider _options;
  
  @override
  Widget build(BuildContext context) {
    _options = Provider.of<QuizOptionsProvider>(context, listen: false);
    return RadioListTile<QuizOptionsMetaData>(
        value: widget._quizOptionMetaData,
        groupValue: _options.defaultOption,
        title: TextFormField(
          controller: widget._quizOptionMetaData.quizText,
          validator: (String? value){
            if(value!=null){
              if(value.isEmpty)
                return null;
              else
                return value;
            }
            else
              return value;
          },
        ),
        secondary: IconButton(icon: Icon(Icons.delete),onPressed: _handleOptionsDelete,),
        onChanged: _handleChanges);
  }

  void _handleOptionsDelete(){
    _options.removeOption(widget._quizOptionMetaData);
  }

  void _handleChanges(QuizOptionsMetaData? selected) {
    if(selected != null)  {
      _options.changeSelected(selected);
    }
  }
}





