import 'package:dance_game/common/content_heading.dart';
import 'package:dance_game/common/popular_with_friends_game_widget.dart';
import 'package:dance_game/model/last_played_game.dart';
import 'package:dance_game/styleguide/colors.dart';
import 'package:dance_game/styleguide/text_styles.dart';
import 'package:flutter/material.dart';

import '../image_asset.dart';
import 'landing_page.dart';

class SecondaryHomePage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Stack(
              children: <Widget>[
                Image.asset(
                  game_sekiro,
                  height: 400,
                  fit: BoxFit.fitHeight,
                ),
                Container(
                  color: Colors.grey.withOpacity(0.5),
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                            child: InkWell(
                              child: Icon(Icons.person, color: Colors.white),
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => LandingPage()));
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 32.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "NEW GAME",
                                  style: newGameTextStyle,
                                ),
                                TextSpan(text: '\n'),
                                TextSpan(
                                  text: "Sekiro: Shadows Dies Twice",
                                  style: newGameNameTextStyle,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          InkWell(
                            onTap: null,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 4),
                              decoration: BoxDecoration(
                                gradient: appGradient,
                                borderRadius: BorderRadius.all(Radius.circular(4)),
                              ),
                              child: Text(
                                "Play",
                                style: newGameTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ContentHeadingWidget(heading: "Popular with Friends"),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: <Widget>[
                        for (var i = 0; i < popularWithFriends.length; i++)
                          PopularWithFriendsWidget(
                            imagePath: popularWithFriends[i],
                            name: tipo[i],
                            subName: subTipo[i],

                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}