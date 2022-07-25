

import 'package:dad_jokes/domain/failures/dad_jokes_failure.dart';
import 'package:dad_jokes/domain/model/dad.jokes.model.dart';
import 'package:dartz/dartz.dart';

abstract class DadJokesRepository {
  Future<Either<DadJokesFailure, DadJokesModel>> getRandomJokes();
}
