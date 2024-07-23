import 'package:flutter/material.dart';
import 'package:sportsapp/data/models/playrs_model.dart';
import 'package:sportsapp/widgets/dialog_players.dart';

class PlayrsCard extends StatelessWidget {
  final Result player;

  const PlayrsCard({required this.player, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Fallback image asset path
    const String fallbackImagePath = 'assets/images/default_player_image.png';

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => CustomDialogWidget(playerData: player),
        );
      },
      child: Stack(
        children: [
          // Top Container with Player Image or Placeholder Icon
          Container(
            height: 350,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(0xff5C5470),
              image: player.playerImage != null && player.playerImage!.isNotEmpty
                  ? DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(player.playerImage!),
                    )
                  : null, // No image if player.playerImage is null or empty
            ),
            child: player.playerImage != null && player.playerImage!.isNotEmpty
                ? null
                : Center(
                    child: Icon(
                      Icons.person,
                      size: 100,
                      color: Colors.white,
                    ),
                  ), // Placeholder icon
          ),
          // Bottom Container with Player Information
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              width: 300,
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.6),
                    blurRadius: 20.0,
                    offset: Offset(-5, -5),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        player.playerName?.trim() ?? "",
                        style: TextStyle(
                          color: Color(0xff352F44),
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        player.playerType ?? "",
                        style: TextStyle(
                          color: Color(0xff352F44),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
