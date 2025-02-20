import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportsapp/data/cubits/playres_cubit/players_cubit.dart';
import 'package:sportsapp/data/cubits/playres_cubit/playres_state.dart';
import 'package:sportsapp/data/models/playrs_model.dart';

class CustomDialogWidget extends StatelessWidget {
  

  const CustomDialogWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          DialogWidget(),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 45,
              height: 45,
              child: IconButton(
                icon: Icon(Icons.close),
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color.fromARGB(255, 170, 169, 169),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //final Result? playerData;
    //late PlayersCubit _playersCubit;
    return BlocProvider(
      create: (context) => PlayersCubit(),
      child: BlocBuilder<PlayersCubit, PlayersState>(
        builder: (context, state) {
          return Container(
            width: 300,
            padding: EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 16,
            ),
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              children: [
                Text("")
                ],
            ),
          );
        },
      ),
    );
  }
}