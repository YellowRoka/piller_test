import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class  FadeTransitionPage<T> extends CustomTransitionPage<T>{
  const FadeTransitionPage({
    super.key,
    required super.child,
    Duration? duration,
  }) : super(
    transitionsBuilder:        _transitionsBuilder,
    transitionDuration:        duration ?? const Duration(seconds: 1),
    reverseTransitionDuration: duration ?? const Duration(seconds: 1),
  );

  static Widget _transitionsBuilder(
    BuildContext      context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget            child
  ){
    return FadeTransition(
      opacity: animation,
      child:   child,
    );
  }
}
