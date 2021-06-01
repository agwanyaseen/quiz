import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_client/providers/quiz_options_provider.dart';
import 'package:quiz_client/screens/quiz_view.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [ChangeNotifierProvider.value(value: QuizOptionsProvider())],
        child: QuizView(),),
    );
  }
}

