import 'package:flutter/material.dart';
import 'package:piller_test/system/themes/app_colors.dart';

class CircularProgresser extends StatelessWidget {
  final Color? color;

  const CircularProgresser({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator( color: color??buttonColor ),
    );
  }
}
