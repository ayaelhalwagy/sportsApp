import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportsapp/data/cubits/playres_cubit/players_cubit.dart';
import 'package:sportsapp/screens/playerscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Players Screen',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
      ),
      home: BlocProvider(
        create: (context) => PlayersCubit()..fetchPlayers(),
        child: const PlayerScreen(),
      ),
    );
  }
}
