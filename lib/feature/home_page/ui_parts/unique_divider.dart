import 'package:flutter/material.dart';

class UniqueDivider extends StatelessWidget {
  const UniqueDivider({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 200, 
    child:  VerticalDivider(
      width:     20,
      thickness: 2,
      indent:    10,
      endIndent: 10,
    ),
  );
}

