import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants/my_app_icons.dart';

class CachedImageWidget extends StatelessWidget {
  const CachedImageWidget({
    this.height,
    required this.imgUrl,
    this.width,
    this.fit,
    super.key,
  });

  final String imgUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CachedNetworkImage(
      height: height ?? size.width * 0.3,
      width: width ?? size.width * 0.2,
      fit: fit ?? BoxFit.cover,
      imageUrl: imgUrl,
      //?? "https://i.ibb.co/FwTPCCc/Ultra-Linx.jpg",
      errorWidget: (context, url, error) =>
          Icon(MyAppIcons.error, color: Colors.red),
    );
  }
}
