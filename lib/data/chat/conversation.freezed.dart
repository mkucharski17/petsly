// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'conversation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ConversationPreviewDataTearOff {
  const _$ConversationPreviewDataTearOff();

  _ConversationPreviewData call(
      {required UserData otherUserData,
      required QueryDocumentSnapshot<Conversation> conversation}) {
    return _ConversationPreviewData(
      otherUserData: otherUserData,
      conversation: conversation,
    );
  }
}

/// @nodoc
const $ConversationPreviewData = _$ConversationPreviewDataTearOff();

/// @nodoc
mixin _$ConversationPreviewData {
  UserData get otherUserData => throw _privateConstructorUsedError;
  QueryDocumentSnapshot<Conversation> get conversation =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConversationPreviewDataCopyWith<ConversationPreviewData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationPreviewDataCopyWith<$Res> {
  factory $ConversationPreviewDataCopyWith(ConversationPreviewData value,
          $Res Function(ConversationPreviewData) then) =
      _$ConversationPreviewDataCopyWithImpl<$Res>;
  $Res call(
      {UserData otherUserData,
      QueryDocumentSnapshot<Conversation> conversation});

  $UserDataCopyWith<$Res> get otherUserData;
}

/// @nodoc
class _$ConversationPreviewDataCopyWithImpl<$Res>
    implements $ConversationPreviewDataCopyWith<$Res> {
  _$ConversationPreviewDataCopyWithImpl(this._value, this._then);

  final ConversationPreviewData _value;
  // ignore: unused_field
  final $Res Function(ConversationPreviewData) _then;

  @override
  $Res call({
    Object? otherUserData = freezed,
    Object? conversation = freezed,
  }) {
    return _then(_value.copyWith(
      otherUserData: otherUserData == freezed
          ? _value.otherUserData
          : otherUserData // ignore: cast_nullable_to_non_nullable
              as UserData,
      conversation: conversation == freezed
          ? _value.conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as QueryDocumentSnapshot<Conversation>,
    ));
  }

  @override
  $UserDataCopyWith<$Res> get otherUserData {
    return $UserDataCopyWith<$Res>(_value.otherUserData, (value) {
      return _then(_value.copyWith(otherUserData: value));
    });
  }
}

/// @nodoc
abstract class _$ConversationPreviewDataCopyWith<$Res>
    implements $ConversationPreviewDataCopyWith<$Res> {
  factory _$ConversationPreviewDataCopyWith(_ConversationPreviewData value,
          $Res Function(_ConversationPreviewData) then) =
      __$ConversationPreviewDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {UserData otherUserData,
      QueryDocumentSnapshot<Conversation> conversation});

  @override
  $UserDataCopyWith<$Res> get otherUserData;
}

/// @nodoc
class __$ConversationPreviewDataCopyWithImpl<$Res>
    extends _$ConversationPreviewDataCopyWithImpl<$Res>
    implements _$ConversationPreviewDataCopyWith<$Res> {
  __$ConversationPreviewDataCopyWithImpl(_ConversationPreviewData _value,
      $Res Function(_ConversationPreviewData) _then)
      : super(_value, (v) => _then(v as _ConversationPreviewData));

  @override
  _ConversationPreviewData get _value =>
      super._value as _ConversationPreviewData;

  @override
  $Res call({
    Object? otherUserData = freezed,
    Object? conversation = freezed,
  }) {
    return _then(_ConversationPreviewData(
      otherUserData: otherUserData == freezed
          ? _value.otherUserData
          : otherUserData // ignore: cast_nullable_to_non_nullable
              as UserData,
      conversation: conversation == freezed
          ? _value.conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as QueryDocumentSnapshot<Conversation>,
    ));
  }
}

/// @nodoc

class _$_ConversationPreviewData implements _ConversationPreviewData {
  const _$_ConversationPreviewData(
      {required this.otherUserData, required this.conversation});

  @override
  final UserData otherUserData;
  @override
  final QueryDocumentSnapshot<Conversation> conversation;

  @override
  String toString() {
    return 'ConversationPreviewData(otherUserData: $otherUserData, conversation: $conversation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ConversationPreviewData &&
            const DeepCollectionEquality()
                .equals(other.otherUserData, otherUserData) &&
            const DeepCollectionEquality()
                .equals(other.conversation, conversation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(otherUserData),
      const DeepCollectionEquality().hash(conversation));

  @JsonKey(ignore: true)
  @override
  _$ConversationPreviewDataCopyWith<_ConversationPreviewData> get copyWith =>
      __$ConversationPreviewDataCopyWithImpl<_ConversationPreviewData>(
          this, _$identity);
}

abstract class _ConversationPreviewData implements ConversationPreviewData {
  const factory _ConversationPreviewData(
          {required UserData otherUserData,
          required QueryDocumentSnapshot<Conversation> conversation}) =
      _$_ConversationPreviewData;

  @override
  UserData get otherUserData;
  @override
  QueryDocumentSnapshot<Conversation> get conversation;
  @override
  @JsonKey(ignore: true)
  _$ConversationPreviewDataCopyWith<_ConversationPreviewData> get copyWith =>
      throw _privateConstructorUsedError;
}

Conversation _$ConversationFromJson(Map<String, dynamic> json) {
  return _Conversation.fromJson(json);
}

/// @nodoc
class _$ConversationTearOff {
  const _$ConversationTearOff();

  _Conversation call(
      {required String firstUserId,
      required String secondUserId,
      required List<Message> messages}) {
    return _Conversation(
      firstUserId: firstUserId,
      secondUserId: secondUserId,
      messages: messages,
    );
  }

  Conversation fromJson(Map<String, Object?> json) {
    return Conversation.fromJson(json);
  }
}

/// @nodoc
const $Conversation = _$ConversationTearOff();

/// @nodoc
mixin _$Conversation {
  String get firstUserId => throw _privateConstructorUsedError;
  String get secondUserId => throw _privateConstructorUsedError;
  List<Message> get messages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConversationCopyWith<Conversation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationCopyWith<$Res> {
  factory $ConversationCopyWith(
          Conversation value, $Res Function(Conversation) then) =
      _$ConversationCopyWithImpl<$Res>;
  $Res call({String firstUserId, String secondUserId, List<Message> messages});
}

/// @nodoc
class _$ConversationCopyWithImpl<$Res> implements $ConversationCopyWith<$Res> {
  _$ConversationCopyWithImpl(this._value, this._then);

  final Conversation _value;
  // ignore: unused_field
  final $Res Function(Conversation) _then;

  @override
  $Res call({
    Object? firstUserId = freezed,
    Object? secondUserId = freezed,
    Object? messages = freezed,
  }) {
    return _then(_value.copyWith(
      firstUserId: firstUserId == freezed
          ? _value.firstUserId
          : firstUserId // ignore: cast_nullable_to_non_nullable
              as String,
      secondUserId: secondUserId == freezed
          ? _value.secondUserId
          : secondUserId // ignore: cast_nullable_to_non_nullable
              as String,
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc
abstract class _$ConversationCopyWith<$Res>
    implements $ConversationCopyWith<$Res> {
  factory _$ConversationCopyWith(
          _Conversation value, $Res Function(_Conversation) then) =
      __$ConversationCopyWithImpl<$Res>;
  @override
  $Res call({String firstUserId, String secondUserId, List<Message> messages});
}

/// @nodoc
class __$ConversationCopyWithImpl<$Res> extends _$ConversationCopyWithImpl<$Res>
    implements _$ConversationCopyWith<$Res> {
  __$ConversationCopyWithImpl(
      _Conversation _value, $Res Function(_Conversation) _then)
      : super(_value, (v) => _then(v as _Conversation));

  @override
  _Conversation get _value => super._value as _Conversation;

  @override
  $Res call({
    Object? firstUserId = freezed,
    Object? secondUserId = freezed,
    Object? messages = freezed,
  }) {
    return _then(_Conversation(
      firstUserId: firstUserId == freezed
          ? _value.firstUserId
          : firstUserId // ignore: cast_nullable_to_non_nullable
              as String,
      secondUserId: secondUserId == freezed
          ? _value.secondUserId
          : secondUserId // ignore: cast_nullable_to_non_nullable
              as String,
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Conversation implements _Conversation {
  const _$_Conversation(
      {required this.firstUserId,
      required this.secondUserId,
      required this.messages});

  factory _$_Conversation.fromJson(Map<String, dynamic> json) =>
      _$$_ConversationFromJson(json);

  @override
  final String firstUserId;
  @override
  final String secondUserId;
  @override
  final List<Message> messages;

  @override
  String toString() {
    return 'Conversation(firstUserId: $firstUserId, secondUserId: $secondUserId, messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Conversation &&
            const DeepCollectionEquality()
                .equals(other.firstUserId, firstUserId) &&
            const DeepCollectionEquality()
                .equals(other.secondUserId, secondUserId) &&
            const DeepCollectionEquality().equals(other.messages, messages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(firstUserId),
      const DeepCollectionEquality().hash(secondUserId),
      const DeepCollectionEquality().hash(messages));

  @JsonKey(ignore: true)
  @override
  _$ConversationCopyWith<_Conversation> get copyWith =>
      __$ConversationCopyWithImpl<_Conversation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConversationToJson(this);
  }
}

abstract class _Conversation implements Conversation {
  const factory _Conversation(
      {required String firstUserId,
      required String secondUserId,
      required List<Message> messages}) = _$_Conversation;

  factory _Conversation.fromJson(Map<String, dynamic> json) =
      _$_Conversation.fromJson;

  @override
  String get firstUserId;
  @override
  String get secondUserId;
  @override
  List<Message> get messages;
  @override
  @JsonKey(ignore: true)
  _$ConversationCopyWith<_Conversation> get copyWith =>
      throw _privateConstructorUsedError;
}

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
class _$MessageTearOff {
  const _$MessageTearOff();

  _Message call(
      {required String senderId,
      required DateTime dateTime,
      required String content,
      bool isRead = false}) {
    return _Message(
      senderId: senderId,
      dateTime: dateTime,
      content: content,
      isRead: isRead,
    );
  }

  Message fromJson(Map<String, Object?> json) {
    return Message.fromJson(json);
  }
}

/// @nodoc
const $Message = _$MessageTearOff();

/// @nodoc
mixin _$Message {
  String get senderId => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  bool get isRead => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res>;
  $Res call({String senderId, DateTime dateTime, String content, bool isRead});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res> implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  final Message _value;
  // ignore: unused_field
  final $Res Function(Message) _then;

  @override
  $Res call({
    Object? senderId = freezed,
    Object? dateTime = freezed,
    Object? content = freezed,
    Object? isRead = freezed,
  }) {
    return _then(_value.copyWith(
      senderId: senderId == freezed
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isRead: isRead == freezed
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$MessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$MessageCopyWith(_Message value, $Res Function(_Message) then) =
      __$MessageCopyWithImpl<$Res>;
  @override
  $Res call({String senderId, DateTime dateTime, String content, bool isRead});
}

/// @nodoc
class __$MessageCopyWithImpl<$Res> extends _$MessageCopyWithImpl<$Res>
    implements _$MessageCopyWith<$Res> {
  __$MessageCopyWithImpl(_Message _value, $Res Function(_Message) _then)
      : super(_value, (v) => _then(v as _Message));

  @override
  _Message get _value => super._value as _Message;

  @override
  $Res call({
    Object? senderId = freezed,
    Object? dateTime = freezed,
    Object? content = freezed,
    Object? isRead = freezed,
  }) {
    return _then(_Message(
      senderId: senderId == freezed
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isRead: isRead == freezed
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Message implements _Message {
  const _$_Message(
      {required this.senderId,
      required this.dateTime,
      required this.content,
      this.isRead = false});

  factory _$_Message.fromJson(Map<String, dynamic> json) =>
      _$$_MessageFromJson(json);

  @override
  final String senderId;
  @override
  final DateTime dateTime;
  @override
  final String content;
  @JsonKey()
  @override
  final bool isRead;

  @override
  String toString() {
    return 'Message(senderId: $senderId, dateTime: $dateTime, content: $content, isRead: $isRead)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Message &&
            const DeepCollectionEquality().equals(other.senderId, senderId) &&
            const DeepCollectionEquality().equals(other.dateTime, dateTime) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.isRead, isRead));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(senderId),
      const DeepCollectionEquality().hash(dateTime),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(isRead));

  @JsonKey(ignore: true)
  @override
  _$MessageCopyWith<_Message> get copyWith =>
      __$MessageCopyWithImpl<_Message>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessageToJson(this);
  }
}

abstract class _Message implements Message {
  const factory _Message(
      {required String senderId,
      required DateTime dateTime,
      required String content,
      bool isRead}) = _$_Message;

  factory _Message.fromJson(Map<String, dynamic> json) = _$_Message.fromJson;

  @override
  String get senderId;
  @override
  DateTime get dateTime;
  @override
  String get content;
  @override
  bool get isRead;
  @override
  @JsonKey(ignore: true)
  _$MessageCopyWith<_Message> get copyWith =>
      throw _privateConstructorUsedError;
}
