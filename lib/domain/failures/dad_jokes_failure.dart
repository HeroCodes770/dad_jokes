import 'package:freezed_annotation/freezed_annotation.dart';

part 'dad_jokes_failure.freezed.dart';

@freezed
class DadJokesFailure with _$DadJokesFailure {
  const DadJokesFailure._();

  const factory DadJokesFailure.server([String? message]) = _ServerError;
} 