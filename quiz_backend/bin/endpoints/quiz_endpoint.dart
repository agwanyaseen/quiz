import 'package:shelf/shelf.dart';

import 'utils.dart';

//Samples EndPoints


Response addQuizHandler(Request request, String name)  {
  print('Quiz Name $name');
  return Response.ok(name);
}

Response retrieveQuiz(Request request)  {
  var response = {
    'result':[
      {
        'id':1,
        'name':'Test'
      },
      {
        'id':2,
        'name':'Test Agwan'
      },
      {
        'id':3,
        'name':'Test patel'
      },
    ]
  };

  return ApiResponse.ok(response);
}
