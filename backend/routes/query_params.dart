// dart_frog new route "/tutorial/query_params"
// ターミナルで dart_frog dev を実行されているか確認
// http://localhost:8080/tutorial/query_params?name=John

// クエリパラメータは request.uri.queryParameters で取得できる
// この場合は `name` が `John` になる
// ToCSAの場合はKOMOJU決済のメソッドに対して amount, currency などを含めて渡すようになりそう

import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  final request = context.request;

  final params = request.uri.queryParameters;
  final name = params['name'] ?? 'there';
  final age = params['age'] ?? 'unknown';

  return Response(body: 'Hi $name, you are $age years old');
}
