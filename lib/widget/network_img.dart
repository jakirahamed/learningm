import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:learningm/widget/kshimmer.dart';

class KCachedImg extends StatelessWidget {
  const KCachedImg({
    Key? key,
    required this.imageUrl,
    this.height = 150,
    this.width,
    this.fit = BoxFit.cover,
  }) : super(key: key);
  final String imageUrl;
  final double height;
  final double? width;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CachedNetworkImage(
        height: height,
        width: width,
        imageUrl: imageUrl,
        fit: fit,
        progressIndicatorBuilder: (context, url, downloadProgress) => KShimmer(
          child: SizedBox(
            height: height,
            width: width ?? 150,
          ),
        ),
      ),
    );
  }
}
