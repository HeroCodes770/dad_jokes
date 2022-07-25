import 'package:dad_jokes/domain/model/dad.jokes.model.dart';
import 'package:dad_jokes/infrastructure/dadjokes.datasource.dart';
import 'package:dad_jokes/presentation/dad.joke.screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const DadJokesScreen()),
    );
  }
}

