// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lecture.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LLecture _$LLectureFromJson(Map<String, dynamic> json) {
  return _LLecture.fromJson(json);
}

/// @nodoc
mixin _$LLecture {
  int get index => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  LectureType get type => throw _privateConstructorUsedError;
  int get seconds => throw _privateConstructorUsedError;
  String? get videoId => throw _privateConstructorUsedError;
  String? get quizId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LLectureCopyWith<LLecture> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LLectureCopyWith<$Res> {
  factory $LLectureCopyWith(LLecture value, $Res Function(LLecture) then) =
      _$LLectureCopyWithImpl<$Res, LLecture>;
  @useResult
  $Res call(
      {int index,
      String name,
      LectureType type,
      int seconds,
      String? videoId,
      String? quizId});
}

/// @nodoc
class _$LLectureCopyWithImpl<$Res, $Val extends LLecture>
    implements $LLectureCopyWith<$Res> {
  _$LLectureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? name = null,
    Object? type = null,
    Object? seconds = null,
    Object? videoId = freezed,
    Object? quizId = freezed,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LectureType,
      seconds: null == seconds
          ? _value.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as int,
      videoId: freezed == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String?,
      quizId: freezed == quizId
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LLectureCopyWith<$Res> implements $LLectureCopyWith<$Res> {
  factory _$$_LLectureCopyWith(
          _$_LLecture value, $Res Function(_$_LLecture) then) =
      __$$_LLectureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int index,
      String name,
      LectureType type,
      int seconds,
      String? videoId,
      String? quizId});
}

/// @nodoc
class __$$_LLectureCopyWithImpl<$Res>
    extends _$LLectureCopyWithImpl<$Res, _$_LLecture>
    implements _$$_LLectureCopyWith<$Res> {
  __$$_LLectureCopyWithImpl(
      _$_LLecture _value, $Res Function(_$_LLecture) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? name = null,
    Object? type = null,
    Object? seconds = null,
    Object? videoId = freezed,
    Object? quizId = freezed,
  }) {
    return _then(_$_LLecture(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as LectureType,
      seconds: null == seconds
          ? _value.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as int,
      videoId: freezed == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String?,
      quizId: freezed == quizId
          ? _value.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LLecture extends _LLecture {
  const _$_LLecture(
      {required this.index,
      required this.name,
      required this.type,
      this.seconds = 0,
      this.videoId,
      this.quizId})
      : super._();

  factory _$_LLecture.fromJson(Map<String, dynamic> json) =>
      _$$_LLectureFromJson(json);

  @override
  final int index;
  @override
  final String name;
  @override
  final LectureType type;
  @override
  @JsonKey()
  final int seconds;
  @override
  final String? videoId;
  @override
  final String? quizId;

  @override
  String toString() {
    return 'LLecture(index: $index, name: $name, type: $type, seconds: $seconds, videoId: $videoId, quizId: $quizId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LLecture &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.seconds, seconds) || other.seconds == seconds) &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            (identical(other.quizId, quizId) || other.quizId == quizId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, index, name, type, seconds, videoId, quizId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LLectureCopyWith<_$_LLecture> get copyWith =>
      __$$_LLectureCopyWithImpl<_$_LLecture>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LLectureToJson(
      this,
    );
  }
}

abstract class _LLecture extends LLecture {
  const factory _LLecture(
      {required final int index,
      required final String name,
      required final LectureType type,
      final int seconds,
      final String? videoId,
      final String? quizId}) = _$_LLecture;
  const _LLecture._() : super._();

  factory _LLecture.fromJson(Map<String, dynamic> json) = _$_LLecture.fromJson;

  @override
  int get index;
  @override
  String get name;
  @override
  LectureType get type;
  @override
  int get seconds;
  @override
  String? get videoId;
  @override
  String? get quizId;
  @override
  @JsonKey(ignore: true)
  _$$_LLectureCopyWith<_$_LLecture> get copyWith =>
      throw _privateConstructorUsedError;
}
