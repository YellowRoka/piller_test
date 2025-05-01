import 'package:flutter/material.dart';

class ObscureIcon extends StatelessWidget {
  final bool       obscureTextEnabled;
  final bool       obscureTextActive;
  final Function() onTap;

  const ObscureIcon({
    super.key, 
    required this.onTap, 
    required this.obscureTextEnabled, 
    required this.obscureTextActive
  });

  @override
  Widget build(BuildContext context) {
    if(!obscureTextEnabled){
      return SizedBox();
    }
    
    return IconButton(
      onPressed: onTap, 
      icon:  
        obscureTextActive ? 
        const Icon(Icons.remove_red_eye_outlined) : 
        const Icon(Icons.remove_red_eye)
    ); 
  }
}
