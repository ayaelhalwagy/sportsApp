import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportsapp/data/cubits/playres_cubit/players_cubit.dart';
import 'package:sportsapp/data/cubits/playres_cubit/playres_state.dart';
import 'package:sportsapp/widgets/playrs.dart';
import 'package:sportsapp/widgets/search_playrs.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<PlayersCubit>(); // Use watch for state changes

    return Scaffold(
      backgroundColor: Color(0xff352F44),
      body: SingleChildScrollView( // Wrap with SingleChildScrollView
        child: Column(
          children: [
            SearchPlayers(
              onChanged: (query) => cubit.filterPlayers(query),
            ),
            BlocBuilder<PlayersCubit, PlayersState>(
              builder: (context, state) {
                if (state is PlayersLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is PlayersSuccess) {
                  return Container(
                    height: MediaQuery.of(context).size.height - 350, // Adjusted height
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
          ],
        ),
      ),
    );
  }
}
