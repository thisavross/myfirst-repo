import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniproject_2/blocs/news_bloc.dart';
import 'package:miniproject_2/blocs/news_state.dart';
import 'package:miniproject_2/repositories/news_repository.dart';
import 'package:miniproject_2/views/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<NewsBloc>(
        create: (context) => NewsBloc(
        initialState: NewsInitState(), newsRepositoty: NewsRepository(), ),
        )
         ],
         child: MaterialApp(
          debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          )),
      home: SplashScreen(),
         ),
      
    );
  }
}
