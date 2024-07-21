import 'package:flutter/material.dart';
import 'package:sportsapp/data/models/playrs_model.dart';
import 'package:sportsapp/widgets/dialog_players.dart';

class PlayrsCard extends StatelessWidget {
  final Result player;
  const PlayrsCard({super.key,
  required this.player
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showDialog(
          context: context,
           builder: (context)=> const CustomDialogWidget(),
           
           );
      },
      child: Stack(
        children: [
          Container(
            height: 320,
            // width: 320,
            margin: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xff5C5470),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(player.playerImage ?? "" ),
                )),
          ),
          //to control a place of containers in stack
      
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              width: 300,
              //margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                //color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Container(
                //padding: EdgeInsets.only(top: 15,left: 15,right: 15),
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(player.playerName??"",
                          style: TextStyle(
                              color: Color(0xff352F44),
                              fontWeight: FontWeight.bold,fontSize: 22)),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        player.playerType??"",
                        style: TextStyle(
                            color: Color(0xff352F44),
                            fontWeight: FontWeight.bold,fontSize: 22),
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
