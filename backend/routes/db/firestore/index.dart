import 'package:dart_frog/dart_frog.dart';
import 'package:firedart/firedart.dart';

class DartFrogUser {
  DartFrogUser({
    required this.name,
    required this.email,
    this.id,
  });

  factory DartFrogUser.fromJson(Map<String, dynamic> json) => DartFrogUser(
        id: json['id'] as String?,
        name: json['name'] as String,
        email: json['email'] as String,
      );

  factory DartFrogUser.fromDocument(Document doc) => DartFrogUser(
        id: doc.id,
        name: doc.map['name'] as String,
        email: doc.map['email'] as String,
      );

  final String? id;
  final String name;
  final String email;

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };
}

Future<Response> onRequest(RequestContext context) async {
  final request = context.request;
  final method = request.method;

  final usersCollection = Firestore.instance.collection('users');

  try {
    switch (method) {
      case HttpMethod.post:
        final data = await request.json() as Map<String, dynamic>;
        final user = DartFrogUser.fromJson(data);

        final doc = await usersCollection.add(user.toJson());
        final document = await usersCollection.document(doc.id).get();
        final createdUser = DartFrogUser.fromDocument(document);

        return Response.json(
          body: {
            'id': createdUser.id,
            ...user.toJson(),
          },
          statusCode: 201,
        );

      case HttpMethod.get:
        final queryParams = request.uri.queryParameters;
        final userId = queryParams['id'];

        if (userId != null) {
          try {
            final document = await usersCollection.document(userId).get();
            final user = DartFrogUser.fromDocument(document);

            return Response.json(
              body: {
                'id': user.id,
                ...user.toJson(),
              },
            );
          } catch (e) {
            return Response.json(
              statusCode: 404,
              body: {'error': 'User not found'},
            );
          }
        }

        final documents = await usersCollection.get();
        final users = documents.map((doc) {
          final user = DartFrogUser.fromDocument(doc);
          return {
            'id': user.id,
            ...user.toJson(),
          };
        }).toList();

        return Response.json(body: users);

      case HttpMethod.put:
        final userId = request.uri.queryParameters['id'];
        if (userId == null) {
          return Response.json(
            statusCode: 400,
            body: {'error': 'User ID is required'},
          );
        }

        try {
          final data = await request.json() as Map<String, dynamic>;
          final user = DartFrogUser.fromJson(data);

          final docRef = usersCollection.document(userId);
          final doc = await docRef.get();
          final exists = doc.map != null;

          if (!exists) {
            return Response.json(
              statusCode: 404,
              body: {'error': 'User not found'},
            );
          }

          await docRef.update(user.toJson());
          final updatedDoc = await docRef.get();
          final updatedUser = DartFrogUser.fromDocument(updatedDoc);

          return Response.json(
            body: {
              'id': updatedUser.id,
              ...updatedUser.toJson(),
            },
          );
        } catch (e) {
          return Response.json(
            statusCode: 400,
            body: {'error': 'Invalid request data'},
          );
        }

      case HttpMethod.delete:
        final userId = request.uri.queryParameters['id'];
        if (userId == null) {
          return Response.json(
            statusCode: 400,
            body: {'error': 'User ID is required'},
          );
        }

        try {
          final docRef = usersCollection.document(userId);
          final doc = await docRef.get();
          final exists = doc.map != null;

          if (!exists) {
            return Response.json(
              statusCode: 404,
              body: {'error': 'User not found'},
            );
          }

          await docRef.delete();
          return Response.json(
            statusCode: 200,
            body: {'message': 'User deleted successfully'},
          );
        } catch (e) {
          return Response.json(
            statusCode: 500,
            body: {'error': 'Failed to delete user'},
          );
        }

      case _:
        return Response.json(
          statusCode: 405,
          body: {'error': 'Method not allowed'},
        );
    }
  } catch (e) {
    return Response.json(
      statusCode: 500,
      body: {'error': e.toString()},
    );
  }
}

// ユーザーの作成
// curl -X POST http://localhost:8080/db/firestore \
//   -H "Content-Type: application/json" \
//   -d '{
//     "name": "山田太郎",
//     "email": "taro@example.com"
//   }'

// 全ユーザーの取得
// curl http://localhost:8080/db/firestore

// 特定のユーザーの取得
// curl "http://localhost:8080/db/firestore?id={user_id}"

// curl -X PUT "http://localhost:8080/db/firestore?id={user_id}" \
//   -H "Content-Type: application/json" \
//   -d '{
//     "name": "山田花子",
//     "email": "hanako@example.com"
//   }'

// ユーザーの削除
// curl -X DELETE "http://localhost:8080/db/firestore?id={user_id}"
