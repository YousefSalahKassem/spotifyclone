import 'package:flutter/material.dart';
import 'package:spotifyclone/constants/colors.dart';
import 'package:spotifyclone/view/widgets/album_card.dart';
import 'package:spotifyclone/view/widgets/bottom_nav_bar.dart';

import '../../data/data.dart';
import '../widgets/row_album_card.dart';
import '../widgets/song_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .6,
            decoration: const BoxDecoration(
              color: ColorsApp.primary,
            ),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(.9),
                    Colors.black.withOpacity(1),
                    Colors.black.withOpacity(1),
                    Colors.black.withOpacity(1),
                  ],
                ),
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Recently Played",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Row(
                            children: const [
                              Icon(Icons.notifications_none),
                              SizedBox(width: 16),
                              Icon(Icons.history),
                              SizedBox(width: 16),
                              Icon(Icons.settings),
                            ],
                          )
                        ],
                      ),
                    ),

                    Container(
                      height: MediaQuery.of(context).size.height*.23,
                      width: double.maxFinite,
                      padding: const EdgeInsets.all(8),
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: recentlyPlayedList.length,
                          itemBuilder: (context,index) => Padding(padding: const EdgeInsets.symmetric(horizontal: 8),child: AlbumCard(label: recentlyPlayedList[index].title,image: AssetImage(recentlyPlayedList[index].image!), index: index,),)),),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Good Morning",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: const[
                              RowAlbumCard(
                                label: "Top 50 - Global",
                                image: AssetImage("assets/top50.jpg"),
                              ),
                              SizedBox(width: 16),
                              RowAlbumCard(
                                label: "Best Mode",
                                image: AssetImage("assets/album1.jpg"),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: const[
                              RowAlbumCard(
                                label: "RapCaviar",
                                image: AssetImage("assets/album2.jpg"),
                              ),
                              SizedBox(width: 16),
                              RowAlbumCard(
                                label: "Eminem",
                                image: AssetImage("assets/album5.jpg"),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children:const [
                              RowAlbumCard(
                                label: "Top 50 - USA",
                                image: AssetImage("assets/album9.jpg"),
                              ),
                              SizedBox(width: 16),
                              RowAlbumCard(
                                label: "Pop Remix",
                                image: AssetImage("assets/album10.jpg"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Based on your recent listening",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        Container(
                            height: MediaQuery.of(context).size.height*.25,
                            width: double.maxFinite,
                            padding: const EdgeInsets.all(8),
                            child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: basedRecentList.length,
                                itemBuilder: (context,index) => Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: SongCard(
                                    image: AssetImage(basedRecentList[index].image!),
                                    index: index,
                                  ),))

                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Recommended radio",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        Container(
                            height: MediaQuery.of(context).size.height*.25,
                            width: double.maxFinite,
                            padding: const EdgeInsets.all(8),
                            child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: recommendedRadioList.length,
                                itemBuilder: (context,index) => Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: SongCard(
                                    image: AssetImage(recommendedRadioList[index].image!),
                                    index: index,
                                  ),))

                        ),
                      ],
                    ),

                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

