import 'package:dio/dio.dart';
import 'package:sportsapp/data/models/playrs_model.dart';

class PlayersRepo {
  Dio dio = Dio();

  Future<ApiResponsePlayersModel?> players() async {
    Response response;

    try {
      response = await dio.get(
          'https://apiv2.allsportsapi.com/football/?met=Players&teamId=96&APIkey=12fdc5641e740d4d6712258667789307135702064e6bef3ab7a8d86e0db273a7');

      if (response.statusCode == 200) {
        ApiResponsePlayersModel modelResponse =
            ApiResponsePlayersModel.fromJson(response.data);
        return modelResponse;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
