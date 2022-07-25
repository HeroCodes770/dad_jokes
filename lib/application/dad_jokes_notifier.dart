import 'package:dad_jokes/domain/model/dad.jokes.model.dart';
import 'package:dad_jokes/infrastructure/dadjokes.datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final jokesProvider =
    StateNotifierProvider<DadJokesNotifier, AsyncValue<DadJokesModel>>(
        (ref) => DadJokesNotifier());

class DadJokesNotifier extends StateNotifier<AsyncValue<DadJokesModel>> {
  DadJokesNotifier() : super(const AsyncValue.loading());

  Future fetchJokes() async {
    state = const AsyncValue.loading();

    final jokeData = await DadJokesRepositoryImpl().getRandomJokes();

    jokeData.fold((failure) {
      print('Entered Here');
      state = AsyncValue.error(failure);
    }, (data) => state = AsyncValue.data(data));
  }
}
