import 'package:flutter/material.dart';

import '../screens/album_view.dart';

class AlbumCard extends StatelessWidget {
  final ImageProvider? image;
  final String? label;
  final Function? onTap;
  final double size;
  final int index;
  const AlbumCard({
    this.image,
    this.label,
    this.onTap,
    this.size = 120,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(onTap: (){Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AlbumView(
              image: image!,
              index: index,
            ),
          ),
        );},child:Hero(tag: UniqueKey(), child: Image(
          image: image!,
          width: size,
          height: size,
          fit: BoxFit.cover,
        ),),),
        const SizedBox(height: 10),
        Text(label!),
      ],
    );
  }
}