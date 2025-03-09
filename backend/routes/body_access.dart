
// dart_frog new route body_access
// ターミナルで dart_frog dev を実行されているか確認
// http://localhost:8080/tutorial/body_access

// bodyは request.body() で取得できる
// 手元で `curl --request POST --url http://localhost:8080/tutorial/body_access --data 'Hello'` を叩くと `The body is "John".` が表示される

import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  final request = context.request;

  final body = await request.body();

  return Response(body: 'The body is "$body".');
}
