import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_field.freezed.dart';

typedef Validator<T> = bool Function(T);

@freezed
class FormField<T> with _$FormField<T> {
  const FormField._();

  const factory FormField({
    T? field,
    String? error,
    Validator<T?>? validator,
  }) = _FormField<T>;

  FormField validate(String error) {
    final valid = validator?.call(field) ?? true;

    return copyWith(field: field, error: !valid ? error : null);
  }
}
