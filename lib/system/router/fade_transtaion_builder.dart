import 'package:flutter/material.dart';

class FadeTransitionBuilder extends StatefulWidget{
  final Widget child;
  final Duration? duration;

  const FadeTransitionBuilder({super.key, this.duration, required this.child});

  @override
  State<FadeTransitionBuilder> createState() => _FadeTransitionBuilderState();
}

class _FadeTransitionBuilderState extends State<FadeTransitionBuilder> with SingleTickerProviderStateMixin{

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: widget.duration?.inSeconds ?? 1));
    controller.forward();
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: controller.drive(CurveTween(curve: Curves.easeIn)),
      child:   widget.child,
    );
  }
}
