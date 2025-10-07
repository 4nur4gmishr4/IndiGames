import 'dart:ui';
import 'package:flutter/material.dart';

class LiquidGlassContainer extends StatefulWidget {
  final Widget child;
  final double blur;
  final double borderRadius;
  final Color color;
  final double opacity;

  const LiquidGlassContainer({
    super.key,
    required this.child,
    this.blur = 10.0,
    this.borderRadius = 16.0,
    this.color = Colors.white,
    this.opacity = 0.2,
  });

  @override
  State<LiquidGlassContainer> createState() => _LiquidGlassContainerState();
}

class _LiquidGlassContainerState extends State<LiquidGlassContainer> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: widget.blur,
            sigmaY: widget.blur,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: widget.color.withAlpha((widget.opacity * 255).toInt()),
              borderRadius: BorderRadius.circular(widget.borderRadius),
              border: Border.all(
                color: widget.color.withAlpha(51), // 0.2 * 255 = 51
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: widget.color.withAlpha(26), // 0.1 * 255 = 25.5 ≈ 26
                  blurRadius: 10,
                  spreadRadius: -5,
                ),
              ],
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}