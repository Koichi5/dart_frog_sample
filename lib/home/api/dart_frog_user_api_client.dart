import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dart_frog_sample/models/dart_frog_user.dart';

class DartFrogUserApiClient {
  DartFrogUserApiClient({String? baseUrl}) {
    // iOSシミュレーター/実機から接続可能なURLを設定
    if (Platform.isIOS) {
      // 実機の場合はコンピュータのIPアドレスを使用
      _baseUrl = 'http://192.168.179.3:8080'; // あなたのPCのIPアドレスに置き換えてください
    } else {
      // Android エミュレータの場合は 10.0.2.2 を使用
      _baseUrl =
          Platform.isAndroid ? 'http://10.0.2.2:8080' : 'http://localhost:8080';
    }
  }

  late final String _baseUrl;

  // ユーザー作成
  Future<DartFrogUser> createUser(DartFrogUser user) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/db/firestore'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 201) {
      return DartFrogUser.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }
    throw Exception('Failed to create user');
  }

  // ユーザー取得
  Future<List<DartFrogUser>> getUsers() async {
    final response = await http.get(Uri.parse('$_baseUrl/db/firestore'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body) as List;
      return jsonList
          .map((json) => DartFrogUser.fromJson(json as Map<String, dynamic>))
          .toList();
    }
    throw Exception('Failed to load users');
  }

  // ユーザー更新
  Future<DartFrogUser> updateUser(String id, DartFrogUser user) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/db/firestore?id=$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      return DartFrogUser.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }
    throw Exception('Failed to update user');
  }

  // ユーザー削除
  Future<void> deleteUser(String id) async {
    final response = await http.delete(
      Uri.parse('$_baseUrl/db/firestore?id=$id'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete user');
    }
  }
}
