import 'package:flutter/material.dart';

class DataLine extends StatelessWidget {
  final String fieldName;
  final String fieldValue;
  
  const DataLine({super.key, required this.fieldName, required this.fieldValue});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth:  300,
      ),
      child: Flex(
        direction:          Axis.horizontal,
        mainAxisAlignment:  MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth:  75
            ),
            child: Text(
              fieldName,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),

          const Spacer(flex: 1),
          
          Flexible(
            flex:  8,
            child: Text(
              fieldValue,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
