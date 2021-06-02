import 'dart:convert';


import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import '../utils/secrets.dart';

Map<String,Object> apiResponseHeaders={
  'content-type':'application/json'
};

class ApiResponse extends Response  {

  ApiResponse.ok(Object? response): super.ok(jsonEncode(response),headers: apiResponseHeaders);

  ApiResponse.notFound(Object response): super.notFound(jsonEncode(response),headers: apiResponseHeaders);

  ApiResponse.error(Object response): super(400,body:jsonEncode(response), headers: apiResponseHeaders);

  ApiResponse.internalServerError(Object response) : super(500, body: jsonEncode(response));
}


SupabaseClient getSupabaseClient()  {
  final secrets =DbSecrets.secrets;
  return  SupabaseClient(secrets?.supabaseUrl??'', secrets?.supabasekey??'');
}
