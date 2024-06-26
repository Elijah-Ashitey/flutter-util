library shared_utils;

import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../shared_utils.dart';

/// create a glass effect
class GlassMorphism extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;
  final double blurRadius;
  final Color? glassColor;
  final Gradient? gradient;
  final double opacity;

  const GlassMorphism({
    Key? key,
    required this.child,
    this.margin,
    this.padding,
    this.border,
    this.borderRadius,
    this.glassColor,
    this.blurRadius = 10,
    this.gradient,
    this.opacity = kEmphasisMedium,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRect(
        clipBehavior: Clip.antiAlias,
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: blurRadius, sigmaY: blurRadius),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              gradient: gradient,
              border: border,
              borderRadius: borderRadius,
            ),
            margin: margin,
            padding: padding,
            child: child,
          ),
        ),
      );
}
