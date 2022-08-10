import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class KShimmer extends StatelessWidget {
  const KShimmer({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Shimmer(
      duration: const Duration(milliseconds: 1500),
      direction: const ShimmerDirection.fromLeftToRight(),
      child: child,
    );
  }
}
