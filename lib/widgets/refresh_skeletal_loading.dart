import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RefreshSkeletalLoading extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadiusGeometry borderRadius;

  const RefreshSkeletalLoading({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = const BorderRadius.all(Radius.circular(4.0)),
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white.withAlpha((0.1 * 255).round()),
        highlightColor: Colors.white.withAlpha((0.6 * 255).round()),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white.withAlpha((0.1 * 255).round()), // Base color for the skeletal loading
          borderRadius: borderRadius,
        ),
      ),
      // Single-directional shimmer effect
      // begin: Alignment.centerLeft,
      // end: Alignment.centerRight,
    );
  }
}