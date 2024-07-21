import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportsapp/data/cubits/playres_cubit/players_cubit.dart';
import 'package:sportsapp/data/cubits/playres_cubit/playres_state.dart';
import 'package:sportsapp/widgets/playrs.dart';
import 'package:sportsapp/widgets/search_playrs.dart';

class Playerscreen extends StatefulWidget {
  const Playerscreen({Key? key}) ;

  @override
  State<Playerscreen> createState() => _PlayerscreenState();
}

class _PlayerscreenState extends State<Playerscreen> {
  late PlayersCubit _playersCubit;

  @override
  void initState() {
 super.initState();
    _playersCubit = PlayersCubit();
    _playersCubit.players(); // Start loading players when the screen initializes
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff352F44),
      body: Column(
        children: [
          // First part
          SearchPlayrs(),

          // Second part - players
          BlocProvider(
            create: (context) => _playersCubit,
            child: BlocBuilder<PlayersCubit, PlayersState>(
              
              builder: (context, state) {
                if (state is PlayersLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is PlayersSuccess) {
                  return Container(
                    height: 420,
                    child: PageView.builder(
                      itemCount: state.responceModel.result!.length,
                      itemBuilder: (context, index) => PlayrsCard(
                        player: state.responceModel.result![index],
                      ),
                    ),
                  );
                } else {
                  return Center(
                    child: Text('Something went wrong'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  
}
