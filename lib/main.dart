import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/newsbloc/news_states.dart';
import 'package:news_app/repositories/news_repository.dart';
import 'package:news_app/screens/home_screen.dart';
import 'blocs/news_category_bloc/bloc.dart';
import 'blocs/news_category_bloc/state.dart';
import 'blocs/newsbloc/news_bloc.dart';
import 'blocs/theme/themek_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsBloc>(
          create: (context) => NewsBloc(
            initialState: NewsInitState(),
            newsRepositoty: NewsRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => SearchBloc(
            initialState: NewsSearchInitState(),
            serchRepositry: SerchRepositry(),
          ),
        ),
        BlocProvider(
          create: (context) => ThemekBloc(),
        )
      ],
      child: BlocBuilder<ThemekBloc, ThemekState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state.themeData,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
