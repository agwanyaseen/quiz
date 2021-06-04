import 'package:flutter/material.dart';

class NewQuizQuestion extends StatelessWidget {
  const NewQuizQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey,
            offset: const Offset(
              5.0,
              5.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ), //BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: const Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              decoration: InputDecoration(hintText: 'New Question'),
            ),
          ),
          ElevatedButton(onPressed: null, child: Text('+'))
        ],
      ),
    );
  }
}
