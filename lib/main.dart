import 'package:clean_block_api_dec22/src/presentation/blocs/my_bloc/bloc/fake_bloc.dart';
import 'package:clean_block_api_dec22/src/presentation/views/my_homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
      providers: [BlocProvider(create: ((context) => FakeBloc()..add(InitalFakeEvent())))],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
