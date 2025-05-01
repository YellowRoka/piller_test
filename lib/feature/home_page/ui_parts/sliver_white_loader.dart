import 'package:flutter/material.dart';
import 'package:piller_test/feature/common_widgets/circular_progresser.dart';
import 'package:piller_test/system/themes/app_colors.dart';

class SliverWhiteLoader extends StatelessWidget {
  const SliverWhiteLoader({super.key});

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter( 
    child: SizedBox(
      height: 200,
      width:  200, 
      child:  CircularProgresser( color: progresOnDarkColor )
    )
  );
}
