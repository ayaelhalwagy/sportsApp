import 'package:bloc/bloc.dart';
import 'package:sportsapp/data/cubits/playres_cubit/playres_state.dart';
import 'package:sportsapp/data/models/playrs_model.dart';
import 'package:sportsapp/data/repositories/players_repo.dart';

class PlayersCubit extends Cubit<PlayersState> {
  List<Result>? allPlayers; // To store all players from the API
  List<Result>? filteredPlayers; // To store filtered players

  PlayersCubit() : super(PlayersLoading());

  Future<void> fetchPlayers() async {
    emit(PlayersLoading());
    ApiResponsePlayersModel? response = await PlayersRepo().players();

    if (response != null) {
      allPlayers = response.result;
      filteredPlayers = allPlayers; // Initialize filtered list with all players
      emit(PlayersSuccess(response));
    } else {
      emit(PlayersError());
    }
  }

  void filterPlayers(String query) {
    if (query.isEmpty) {
      filteredPlayers = allPlayers; // Reset to all players if query is empty
    } else {
      filteredPlayers = allPlayers
          ?.where((player) =>
              player.playerName!.toLowerCase().replaceAll(" ", "").contains(query.toLowerCase().replaceAll(" ", "")))
          .toList();
    }
    emit(PlayersSuccess(ApiResponsePlayersModel(result: filteredPlayers)));
  }
}
