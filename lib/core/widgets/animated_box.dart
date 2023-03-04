import 'package:counter_app/core/extentions/size_extention.dart';
import 'package:counter_app/core/widgets/zoomin_anmation_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../sources/assets_resources.dart';

class AnimatedBox extends StatefulWidget {
  const AnimatedBox({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<AnimatedBox> createState() => _AnimatedBoxState();
}

class _AnimatedBoxState extends State<AnimatedBox> {
  AnimationController? controller;

  @override
  Widget build(BuildContext context) {
    controller?.forward(from: 0.0);
    return SizedBox(
      height: context.height / 2,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Lottie.asset(AssetResources.counterTextBackground),
          ZoomIn(
              duration: const Duration(milliseconds: 400),
              manualTrigger: true,
              from: 2.0,
              controller: (animationCtrl) => controller = animationCtrl,
              child: widget.child),
        ],
      ),
    );
  }
}
