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

Conversation _$ConversationFromJson(Map<String, dynamic> json) {
  return _Conversation.fromJson(json);
}

/// @nodoc
class _$ConversationTearOff {
  const _$ConversationTearOff();

  _Conversation call(
      {required ConversationParticipant firstUser,
      required ConversationParticipant secondUser,
      required List<Message> messages}) {
    return _Conversation(
      firstUser: firstUser,
      secondUser: secondUser,
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
  ConversationParticipant get firstUser => throw _privateConstructorUsedError;
  ConversationParticipant get secondUser => throw _privateConstructorUsedError;
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
  $Res call(
      {ConversationParticipant firstUser,
      ConversationParticipant secondUser,
      List<Message> messages});

  $ConversationParticipantCopyWith<$Res> get firstUser;
  $ConversationParticipantCopyWith<$Res> get secondUser;
}

/// @nodoc
class _$ConversationCopyWithImpl<$Res> implements $ConversationCopyWith<$Res> {
  _$ConversationCopyWithImpl(this._value, this._then);

  final Conversation _value;
  // ignore: unused_field
  final $Res Function(Conversation) _then;

  @override
  $Res call({
    Object? firstUser = freezed,
    Object? secondUser = freezed,
    Object? messages = freezed,
  }) {
    return _then(_value.copyWith(
      firstUser: firstUser == freezed
          ? _value.firstUser
          : firstUser // ignore: cast_nullable_to_non_nullable
              as ConversationParticipant,
      secondUser: secondUser == freezed
          ? _value.secondUser
          : secondUser // ignore: cast_nullable_to_non_nullable
              as ConversationParticipant,
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }

  @override
  $ConversationParticipantCopyWith<$Res> get firstUser {
    return $ConversationParticipantCopyWith<$Res>(_value.firstUser, (value) {
      return _then(_value.copyWith(firstUser: value));
    });
  }

  @override
  $ConversationParticipantCopyWith<$Res> get secondUser {
    return $ConversationParticipantCopyWith<$Res>(_value.secondUser, (value) {
      return _then(_value.copyWith(secondUser: value));
    });
  }
}

/// @nodoc
abstract class _$ConversationCopyWith<$Res>
    implements $ConversationCopyWith<$Res> {
  factory _$ConversationCopyWith(
          _Conversation value, $Res Function(_Conversation) then) =
      __$ConversationCopyWithImpl<$Res>;
  @override
  $Res call(
      {ConversationParticipant firstUser,
      ConversationParticipant secondUser,
      List<Message> messages});

  @override
  $ConversationParticipantCopyWith<$Res> get firstUser;
  @override
  $ConversationParticipantCopyWith<$Res> get secondUser;
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
    Object? firstUser = freezed,
    Object? secondUser = freezed,
    Object? messages = freezed,
  }) {
    return _then(_Conversation(
      firstUser: firstUser == freezed
          ? _value.firstUser
          : firstUser // ignore: cast_nullable_to_non_nullable
              as ConversationParticipant,
      secondUser: secondUser == freezed
          ? _value.secondUser
          : secondUser // ignore: cast_nullable_to_non_nullable
              as ConversationParticipant,
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
      {required this.firstUser,
      required this.secondUser,
      required this.messages});

  factory _$_Conversation.fromJson(Map<String, dynamic> json) =>
      _$$_ConversationFromJson(json);

  @override
  final ConversationParticipant firstUser;
  @override
  final ConversationParticipant secondUser;
  @override
  final List<Message> messages;

  @override
  String toString() {
    return 'Conversation(firstUser: $firstUser, secondUser: $secondUser, messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Conversation &&
            const DeepCollectionEquality().equals(other.firstUser, firstUser) &&
            const DeepCollectionEquality()
                .equals(other.secondUser, secondUser) &&
            const DeepCollectionEquality().equals(other.messages, messages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(firstUser),
      const DeepCollectionEquality().hash(secondUser),
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
      {required ConversationParticipant firstUser,
      required ConversationParticipant secondUser,
      required List<Message> messages}) = _$_Conversation;

  factory _Conversation.fromJson(Map<String, dynamic> json) =
      _$_Conversation.fromJson;

  @override
  ConversationParticipant get firstUser;
  @override
  ConversationParticipant get secondUser;
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

ConversationParticipant _$ConversationParticipantFromJson(
    Map<String, dynamic> json) {
  return _ConversationParticipant.fromJson(json);
}

/// @nodoc
class _$ConversationParticipantTearOff {
  const _$ConversationParticipantTearOff();

  _ConversationParticipant call(
      {required String id, required String name, String? photoUrl}) {
    return _ConversationParticipant(
      id: id,
      name: name,
      photoUrl: photoUrl,
    );
  }

  ConversationParticipant fromJson(Map<String, Object?> json) {
    return ConversationParticipant.fromJson(json);
  }
}

/// @nodoc
const $ConversationParticipant = _$ConversationParticipantTearOff();

/// @nodoc
mixin _$ConversationParticipant {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConversationParticipantCopyWith<ConversationParticipant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationParticipantCopyWith<$Res> {
  factory $ConversationParticipantCopyWith(ConversationParticipant value,
          $Res Function(ConversationParticipant) then) =
      _$ConversationParticipantCopyWithImpl<$Res>;
  $Res call({String id, String name, String? photoUrl});
}

/// @nodoc
class _$ConversationParticipantCopyWithImpl<$Res>
    implements $ConversationParticipantCopyWith<$Res> {
  _$ConversationParticipantCopyWithImpl(this._value, this._then);

  final ConversationParticipant _value;
  // ignore: unused_field
  final $Res Function(ConversationParticipant) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? photoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ConversationParticipantCopyWith<$Res>
    implements $ConversationParticipantCopyWith<$Res> {
  factory _$ConversationParticipantCopyWith(_ConversationParticipant value,
          $Res Function(_ConversationParticipant) then) =
      __$ConversationParticipantCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, String? photoUrl});
}

/// @nodoc
class __$ConversationParticipantCopyWithImpl<$Res>
    extends _$ConversationParticipantCopyWithImpl<$Res>
    implements _$ConversationParticipantCopyWith<$Res> {
  __$ConversationParticipantCopyWithImpl(_ConversationParticipant _value,
      $Res Function(_ConversationParticipant) _then)
      : super(_value, (v) => _then(v as _ConversationParticipant));

  @override
  _ConversationParticipant get _value =>
      super._value as _ConversationParticipant;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? photoUrl = freezed,
  }) {
    return _then(_ConversationParticipant(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ConversationParticipant implements _ConversationParticipant {
  const _$_ConversationParticipant(
      {required this.id, required this.name, this.photoUrl});

  factory _$_ConversationParticipant.fromJson(Map<String, dynamic> json) =>
      _$$_ConversationParticipantFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? photoUrl;

  @override
  String toString() {
    return 'ConversationParticipant(id: $id, name: $name, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ConversationParticipant &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.photoUrl, photoUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(photoUrl));

  @JsonKey(ignore: true)
  @override
  _$ConversationParticipantCopyWith<_ConversationParticipant> get copyWith =>
      __$ConversationParticipantCopyWithImpl<_ConversationParticipant>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConversationParticipantToJson(this);
  }
}

abstract class _ConversationParticipant implements ConversationParticipant {
  const factory _ConversationParticipant(
      {required String id,
      required String name,
      String? photoUrl}) = _$_ConversationParticipant;

  factory _ConversationParticipant.fromJson(Map<String, dynamic> json) =
      _$_ConversationParticipant.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get photoUrl;
  @override
  @JsonKey(ignore: true)
  _$ConversationParticipantCopyWith<_ConversationParticipant> get copyWith =>
      throw _privateConstructorUsedError;
}
