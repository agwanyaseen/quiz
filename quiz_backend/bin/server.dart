import 'dart:io';
import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart';

import 'endpoints/question_endpoints.dart';
import 'endpoints/quiz_endpoint.dart';
import 'utils/secrets.dart';

// Configure routes.
final _router = Router()
  ..get('/', _rootHandler)
  ..get('/echo/<message>', _echoHandler)
  ..post('/api/quiz/',addQuizHandler)
  ..get('/api/quiz',retrieveQuiz)
  ..delete('/api/quiz/<id>', removeQuizHandler)
  ..get('/api/questions/<id>', getquizQuestionsHandler);

Response _rootHandler(Request req) {
  return Response.ok('Hello, World!\n');
}

Response _echoHandler(Request request) {
  final message = params(request, 'message');
  return Response.ok('$message\n');
}

void main(List<String> args) async {
  registerSecrets();
  await configureShelf();
}

void registerSecrets() async {
  final fileContents = await File('assets/db_secrets.json').readAsString();
  final jsonContent = jsonDecode(fileContents);
  final mapContent = jsonContent as Map; 
  DbSecrets.registerCredentials(supabasekey: mapContent['key'],supabaseUrl: mapContent['url']);
} 
Future<void>configureShelf() async {
  final overrideHeaders = {
    ACCESS_CONTROL_ALLOW_ORIGIN: '*',
    'Content-Type': 'application/json;charset=utf-8'
  };

  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final _handler = Pipeline().addMiddleware(corsHeaders(headers: overrideHeaders)).addMiddleware(logRequests()).addHandler(_router);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '59933');
  final server = await serve(_handler, ip, port);
  print('Server listening on port ${server.port}');
}