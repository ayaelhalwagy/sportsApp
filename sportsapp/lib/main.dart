import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportsapp/data/cubits/playres_cubit/players_cubit.dart';
import 'package:sportsapp/screens/playerscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //to hidden debug mark
      debugShowCheckedModeBanner: false,
      title: 'Palyers screen',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => PlayersCubit(),
        child:const 
       Playerscreen(),
      ),
    );
  }
}
