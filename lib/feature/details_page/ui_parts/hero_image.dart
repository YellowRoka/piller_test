import 'package:flutter/material.dart';
import 'package:piller_test/data/service/home_service/model/home_data_model.dart';
import 'package:piller_test/feature/common_widgets/circular_progresser.dart';

class HeroImage extends StatelessWidget {
  final HomeDataModel data;

  const HeroImage(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'DATA_IMG-${data.id}',
      child: Center(
        child: SizedBox(
          height: 300,
          width:  300,
          child:  ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child:        Image.network(
              data.image ?? "",
              cacheHeight:    300,
              cacheWidth:     300,
              errorBuilder:   (context, error, stackTrace)      => const Center( child: Icon(Icons.error) ),
              loadingBuilder: (context, child, loadingProgress) => 
                ( loadingProgress == null )? 
                ( child                   ): 
                ( CircularProgresser()    ),
            ),
          )
        ),
      ),
    );
  }
}
