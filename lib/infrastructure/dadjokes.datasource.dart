import 'package:dad_jokes/domain/consts/constants.dart';
import 'package:dad_jokes/domain/failures/dad_jokes_failure.dart';
import 'package:dad_jokes/domain/model/dad.jokes.model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../domain/dadjokes.facade.dart';

class DadJokesRepositoryImpl implements DadJokesRepository {
  final _dio = Dio();
  @override
  Future<Either<DadJokesFailure, DadJokesModel>> getRandomJokes() async {
    try {
      final request = await _dio.request(baseUrl,
          options: Options(
            headers: {
              'X-RapidAPI-Key': apiKey,
              'X-RapidAPI-Host': 'dad-jokes.p.rapidapi.com'
            },
          ));
      if (request.statusCode == 200) {
        final jsonResponse = await request.data['body'][0];
        final dadJokes = DadJokesModel.fromJson(jsonResponse);
        print('This is the ${dadJokes.toString()}');
        return Right(dadJokes);
      }
    } catch (e) {
      return Left(DadJokesFailure.server(e.toString()));
    }
    return const Left(DadJokesFailure.server());
  }
}



