// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'conversation_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ConversationListStateTearOff {
  const _$ConversationListStateTearOff();

  _ConversationListState call(
      {bool loading = true,
      List<ConversationPreviewData> conversations = const []}) {
    return _ConversationListState(
      loading: loading,
      conversations: conversations,
    );
  }
}

/// @nodoc
const $ConversationListState = _$ConversationListStateTearOff();

/// @nodoc
mixin _$ConversationListState {
  bool get loading => throw _privateConstructorUsedError;
  List<ConversationPreviewData> get conversations =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConversationListStateCopyWith<ConversationListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationListStateCopyWith<$Res> {
  factory $ConversationListStateCopyWith(ConversationListState value,
          $Res Function(ConversationListState) then) =
      _$ConversationListStateCopyWithImpl<$Res>;
  $Res call({bool loading, List<ConversationPreviewData> conversations});
}

/// @nodoc
class _$ConversationListStateCopyWithImpl<$Res>
    implements $ConversationListStateCopyWith<$Res> {
  _$ConversationListStateCopyWithImpl(this._value, this._then);

  final ConversationListState _value;
  // ignore: unused_field
  final $Res Function(ConversationListState) _then;

  @override
  $Res call({
    Object? loading = freezed,
    Object? conversations = freezed,
  }) {
    return _then(_value.copyWith(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      conversations: conversations == freezed
          ? _value.conversations
          : conversations // ignore: cast_nullable_to_non_nullable
              as List<ConversationPreviewData>,
    ));
  }
}

/// @nodoc
abstract class _$ConversationListStateCopyWith<$Res>
    implements $ConversationListStateCopyWith<$Res> {
  factory _$ConversationListStateCopyWith(_ConversationListState value,
          $Res Function(_ConversationListState) then) =
      __$ConversationListStateCopyWithImpl<$Res>;
  @override
  $Res call({bool loading, List<ConversationPreviewData> conversations});
}

/// @nodoc
class __$ConversationListStateCopyWithImpl<$Res>
    extends _$ConversationListStateCopyWithImpl<$Res>
    implements _$ConversationListStateCopyWith<$Res> {
  __$ConversationListStateCopyWithImpl(_ConversationListState _value,
      $Res Function(_ConversationListState) _then)
      : super(_value, (v) => _then(v as _ConversationListState));

  @override
  _ConversationListState get _value => super._value as _ConversationListState;

  @override
  $Res call({
    Object? loading = freezed,
    Object? conversations = freezed,
  }) {
    return _then(_ConversationListState(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      conversations: conversations == freezed
          ? _value.conversations
          : conversations // ignore: cast_nullable_to_non_nullable
              as List<ConversationPreviewData>,
    ));
  }
}

/// @nodoc

class _$_ConversationListState implements _ConversationListState {
  const _$_ConversationListState(
      {this.loading = true, this.conversations = const []});

  @JsonKey()
  @override
  final bool loading;
  @JsonKey()
  @override
  final List<ConversationPreviewData> conversations;

  @override
  String toString() {
    return 'ConversationListState(loading: $loading, conversations: $conversations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ConversationListState &&
            const DeepCollectionEquality().equals(other.loading, loading) &&
            const DeepCollectionEquality()
                .equals(other.conversations, conversations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loading),
      const DeepCollectionEquality().hash(conversations));

  @JsonKey(ignore: true)
  @override
  _$ConversationListStateCopyWith<_ConversationListState> get copyWith =>
      __$ConversationListStateCopyWithImpl<_ConversationListState>(
          this, _$identity);
}

abstract class _ConversationListState implements ConversationListState {
  const factory _ConversationListState(
      {bool loading,
      List<ConversationPreviewData> conversations}) = _$_ConversationListState;

  @override
  bool get loading;
  @override
  List<ConversationPreviewData> get conversations;
  @override
  @JsonKey(ignore: true)
  _$ConversationListStateCopyWith<_ConversationListState> get copyWith =>
      throw _privateConstructorUsedError;
}
