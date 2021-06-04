import 'package:flutter/material.dart';

class BuildOptionsRow extends StatelessWidget {
  final String option;
  final bool isCorrect;
  const BuildOptionsRow({required this.option,required this.isCorrect});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Icon(Icons.circle,size: 15,color: isCorrect?Theme.of(context).primaryColor:Colors.grey[400]),
          Expanded(child: Padding(padding: const EdgeInsets.only(left: 10),child: Text(option))),
        ],
      ),
    );
  }
}