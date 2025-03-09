// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dart_frog_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DartFrogUser {

 String? get id; String get name; String get email;
/// Create a copy of DartFrogUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DartFrogUserCopyWith<DartFrogUser> get copyWith => _$DartFrogUserCopyWithImpl<DartFrogUser>(this as DartFrogUser, _$identity);

  /// Serializes this DartFrogUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DartFrogUser&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email);

@override
String toString() {
  return 'DartFrogUser(id: $id, name: $name, email: $email)';
}


}

/// @nodoc
abstract mixin class $DartFrogUserCopyWith<$Res>  {
  factory $DartFrogUserCopyWith(DartFrogUser value, $Res Function(DartFrogUser) _then) = _$DartFrogUserCopyWithImpl;
@useResult
$Res call({
 String? id, String name, String email
});




}
/// @nodoc
class _$DartFrogUserCopyWithImpl<$Res>
    implements $DartFrogUserCopyWith<$Res> {
  _$DartFrogUserCopyWithImpl(this._self, this._then);

  final DartFrogUser _self;
  final $Res Function(DartFrogUser) _then;

/// Create a copy of DartFrogUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? email = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _DartFrogUser implements DartFrogUser {
  const _DartFrogUser({this.id, required this.name, required this.email});
  factory _DartFrogUser.fromJson(Map<String, dynamic> json) => _$DartFrogUserFromJson(json);

@override final  String? id;
@override final  String name;
@override final  String email;

/// Create a copy of DartFrogUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DartFrogUserCopyWith<_DartFrogUser> get copyWith => __$DartFrogUserCopyWithImpl<_DartFrogUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DartFrogUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DartFrogUser&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email);

@override
String toString() {
  return 'DartFrogUser(id: $id, name: $name, email: $email)';
}


}

/// @nodoc
abstract mixin class _$DartFrogUserCopyWith<$Res> implements $DartFrogUserCopyWith<$Res> {
  factory _$DartFrogUserCopyWith(_DartFrogUser value, $Res Function(_DartFrogUser) _then) = __$DartFrogUserCopyWithImpl;
@override @useResult
$Res call({
 String? id, String name, String email
});




}
/// @nodoc
class __$DartFrogUserCopyWithImpl<$Res>
    implements _$DartFrogUserCopyWith<$Res> {
  __$DartFrogUserCopyWithImpl(this._self, this._then);

  final _DartFrogUser _self;
  final $Res Function(_DartFrogUser) _then;

/// Create a copy of DartFrogUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? email = null,}) {
  return _then(_DartFrogUser(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
