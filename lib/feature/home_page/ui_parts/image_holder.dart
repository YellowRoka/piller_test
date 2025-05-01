import 'package:flutter/material.dart';
import 'package:piller_test/feature/common_widgets/circular_progresser.dart';

class ImageHolder extends StatelessWidget {
  final String? image;

  const ImageHolder({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top:    10,
        bottom: 10,
        left:   10,
      ),
      height: 180,
      width:  180,
      child:  ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft:    Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        child: Image.network(
          image ?? "",
          cacheHeight:    180,
          cacheWidth:     180,
          errorBuilder:   (context, error, stackTrace)      => _buildErrorImage(),
          loadingBuilder: (context, child, loadingProgress) => _buildLoadingImage( child, loadingProgress ),
        ),
      ),
    );
  }
  
  Widget _buildErrorImage() =>
    const Center(child: Icon(Icons.image_not_supported_outlined));

  Widget _buildLoadingImage(child,loadingProgress) =>             
    ( loadingProgress == null                   )? 
    ( child                                     ): 
    ( const Center(child: CircularProgresser()) );
}
