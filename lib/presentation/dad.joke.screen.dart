import 'dart:ui';

import 'package:dad_jokes/application/dad_jokes_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/model/dad.jokes.model.dart';

class DadJokesScreen extends ConsumerStatefulWidget {
  const DadJokesScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<DadJokesScreen> createState() => _DadJokesScreenState();
}

class _DadJokesScreenState extends ConsumerState<DadJokesScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(jokesProvider.notifier).fetchJokes();
  }

  @override
  Widget build(BuildContext context) {
    AsyncValue<DadJokesModel> state = ref.watch(jokesProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Jokes To Laugh'),
        centerTitle: true,
        
      ),
        body: state.when(
            data: ((data)=>
               PageView.builder(
                onPageChanged: (value) {
                    ref.watch(jokesProvider.notifier).fetchJokes();
                  },
                itemBuilder: ((context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: Text(data.setup, textAlign: TextAlign.center,)),
                        const SizedBox(height: 30),
                        Center(child: Text(data.punchline, textAlign: TextAlign.center,)),
                        
                      ],
                    );
                  }),
            )),
            error: (err, stk) => Center(
                    child: Text(
                  'Error, \nSomething Went Wrong',
                  style: Theme.of(context).textTheme.bodyMedium,
                )),
            loading: () => const Center(child: CircularProgressIndicator())));
  }
}
