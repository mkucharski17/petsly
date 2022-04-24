// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'conversation_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ConversationDetailsStateTearOff {
  const _$ConversationDetailsStateTearOff();

  _ConversationDetailsState call(
      {bool loading = true,
      QueryDocumentSnapshot<Conversation>? conversation}) {
    return _ConversationDetailsState(
      loading: loading,
      conversation: conversation,
    );
  }
}

/// @nodoc
const $ConversationDetailsState = _$ConversationDetailsStateTearOff();

/// @nodoc
mixin _$ConversationDetailsState {
  bool get loading => throw _privateConstructorUsedError;
  QueryDocumentSnapshot<Conversation>? get conversation =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConversationDetailsStateCopyWith<ConversationDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationDetailsStateCopyWith<$Res> {
  factory $ConversationDetailsStateCopyWith(ConversationDetailsState value,
          $Res Function(ConversationDetailsState) then) =
      _$ConversationDetailsStateCopyWithImpl<$Res>;
  $Res call({bool loading, QueryDocumentSnapshot<Conversation>? conversation});
}

/// @nodoc
class _$ConversationDetailsStateCopyWithImpl<$Res>
    implements $ConversationDetailsStateCopyWith<$Res> {
  _$ConversationDetailsStateCopyWithImpl(this._value, this._then);

  final ConversationDetailsState _value;
  // ignore: unused_field
  final $Res Function(ConversationDetailsState) _then;

  @override
  $Res call({
    Object? loading = freezed,
    Object? conversation = freezed,
  }) {
    return _then(_value.copyWith(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      conversation: conversation == freezed
          ? _value.conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as QueryDocumentSnapshot<Conversation>?,
    ));
  }
}

/// @nodoc
abstract class _$ConversationDetailsStateCopyWith<$Res>
    implements $ConversationDetailsStateCopyWith<$Res> {
  factory _$ConversationDetailsStateCopyWith(_ConversationDetailsState value,
          $Res Function(_ConversationDetailsState) then) =
      __$ConversationDetailsStateCopyWithImpl<$Res>;
  @override
  $Res call({bool loading, QueryDocumentSnapshot<Conversation>? conversation});
}

/// @nodoc
class __$ConversationDetailsStateCopyWithImpl<$Res>
    extends _$ConversationDetailsStateCopyWithImpl<$Res>
    implements _$ConversationDetailsStateCopyWith<$Res> {
  __$ConversationDetailsStateCopyWithImpl(_ConversationDetailsState _value,
      $Res Function(_ConversationDetailsState) _then)
      : super(_value, (v) => _then(v as _ConversationDetailsState));

  @override
  _ConversationDetailsState get _value =>
      super._value as _ConversationDetailsState;

  @override
  $Res call({
    Object? loading = freezed,
    Object? conversation = freezed,
  }) {
    return _then(_ConversationDetailsState(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      conversation: conversation == freezed
          ? _value.conversation
          : conversation // ignore: cast_nullable_to_non_nullable
              as QueryDocumentSnapshot<Conversation>?,
    ));
  }
}

/// @nodoc

class _$_ConversationDetailsState implements _ConversationDetailsState {
  const _$_ConversationDetailsState({this.loading = true, this.conversation});

  @JsonKey()
  @override
  final bool loading;
  @override
  final QueryDocumentSnapshot<Conversation>? conversation;

  @override
  String toString() {
    return 'ConversationDetailsState(loading: $loading, conversation: $conversation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ConversationDetailsState &&
            const DeepCollectionEquality().equals(other.loading, loading) &&
            const DeepCollectionEquality()
                .equals(other.conversation, conversation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loading),
      const DeepCollectionEquality().hash(conversation));

  @JsonKey(ignore: true)
  @override
  _$ConversationDetailsStateCopyWith<_ConversationDetailsState> get copyWith =>
      __$ConversationDetailsStateCopyWithImpl<_ConversationDetailsState>(
          this, _$identity);
}

abstract class _ConversationDetailsState implements ConversationDetailsState {
  const factory _ConversationDetailsState(
          {bool loading, QueryDocumentSnapshot<Conversation>? conversation}) =
      _$_ConversationDetailsState;

  @override
  bool get loading;
  @override
  QueryDocumentSnapshot<Conversation>? get conversation;
  @override
  @JsonKey(ignore: true)
  _$ConversationDetailsStateCopyWith<_ConversationDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
