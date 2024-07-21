import 'package:bloc/bloc.dart';
import 'package:sportsapp/data/cubits/playres_cubit/playres_state.dart';
import 'package:sportsapp/data/models/playrs_model.dart';
import 'package:sportsapp/data/repositories/players_repo.dart';

class PlayersCubit extends Cubit<PlayersState> {
  PlayersCubit() : super(PlayersLoading());

  Future<void> players() async {

    emit(PlayersLoading());
    ApiResponsePlayersModel? response = await PlayersRepo().players();

    if (response != null) {
      emit(PlayersSuccess(response));
    } else {
      emit(PlayersError());
    }
  }
}

