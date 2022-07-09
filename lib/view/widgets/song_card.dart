import 'package:flutter/material.dart';

import '../screens/album_view.dart';

class SongCard extends StatelessWidget {
  final AssetImage image;
  final int index;
  const SongCard({
    required this.image,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Column(
        children: [
          GestureDetector(onTap: () {Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AlbumView(
                image: image,
                index: index,
              ),
            ),
          );},child: Hero(tag: UniqueKey(), child:  Image(
            image: image,
            width: 140,
            height: 140,
          ),),),
          Text(
            "Bad Bunny, Drake, Justin Bieber, Taylor Swift, Ed Sheeran",
            style: Theme.of(context).textTheme.caption,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}