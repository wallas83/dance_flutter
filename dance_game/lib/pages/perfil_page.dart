import 'package:dance_game/common/content_heading.dart';
import 'package:dance_game/common/last_played_game_tile.dart';
import 'package:dance_game/common/rounded_image_widget.dart';
import 'package:dance_game/image_asset.dart';
import 'package:dance_game/model/friends.dart';
import 'package:dance_game/model/last_played_game.dart';
import 'package:dance_game/pages/home_page.dart';
import 'package:dance_game/styleguide/colors.dart';
import 'package:dance_game/styleguide/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailGamePerfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final logoHeight = screenHeight * 0.4;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(screenWidth * 0.4, 10),
            child: Transform.rotate(
              angle: -0.1,
              child: SvgPicture.asset(
                logo,
                height: logoHeight,
                color: logoTintColor,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        Icons.search,
                        color: primaryTextColor,
                      ),
                      InkWell(
                        child: Icon(Icons.arrow_forward, color: primaryTextColor),
                        onTap: () {
                         Navigator.pop(context);
                         },
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                        ),
                        child: Row(
                          children: <Widget>[
                            RoundedImageWidget(imagePath: player1, ranking: 39, showRanking: true),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Hello',
                                      style: userNameTextStyle,
                                    ),
                                    TextSpan(text: '\n'),
                                    TextSpan(text: "Wilson Huanca", style: userNameTextStyle),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ContentHeadingWidget(heading: "Friends"),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            children: <Widget>[
                              for (var i = 0; i < friends.length; i++)
                                RoundedImageWidget(
                                  imagePath: friends[i].imagePath,
                                  isOnline: friends[i].isOnline,
                                  name: friends[i].name,
                                ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0, bottom: 16, top: 16),
                        child: Material(
                          elevation: 4,
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 32.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "HOURS PLAYED",
                                      style: hoursPlayedLabelTextStyle,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "297 Hours",
                                  style: hoursPlayedTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      ContentHeadingWidget(heading: "Last played games"),
                      for (var i = 0; i < lastPlayedGames.length; i++)
                        LastPlayedGameTile(
                          lastPlayedGame: lastPlayedGames[i],
                          screenWidth: screenWidth,
                          gameProgress: lastPlayedGames[i].gameProgress,
                        ),

                    ],
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}