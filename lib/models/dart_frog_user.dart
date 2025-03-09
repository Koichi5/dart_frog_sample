import 'package:freezed_annotation/freezed_annotation.dart';

part 'dart_frog_user.freezed.dart';
part 'dart_frog_user.g.dart';

@freezed
abstract class  DartFrogUser with _$DartFrogUser {
  const factory DartFrogUser({
    String? id,
    required String name,
    required String email,
  }) = _DartFrogUser;

  factory DartFrogUser.fromJson(Map<String, dynamic> json) => _$DartFrogUserFromJson(json);
}
