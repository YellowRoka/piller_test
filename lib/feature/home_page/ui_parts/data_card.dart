import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:piller_test/data/service/home_service/model/home_data_model.dart';
import 'package:piller_test/feature/common_widgets/data_line.dart';
import 'package:piller_test/feature/home_page/ui_parts/image_holder.dart';
import 'package:piller_test/feature/home_page/ui_parts/unique_divider.dart';
import 'package:piller_test/generated/locale_keys.g.dart';

class DataCard extends StatelessWidget {
  final HomeDataModel data;
  final VoidCallback  onTap;

  const DataCard({
    super.key, 
    required this.data,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Flex(
          direction: Axis.horizontal,
          children: [

            Hero(
              tag:   'DATA_IMG-${data.id}',
              child: ImageHolder(image: data.image)
            ),
            
            const UniqueDivider(),

            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 150,
              ),
              child: Flex(
                direction:          Axis.vertical,
                mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              
                  DataLine(
                    fieldName:  LocaleKeys.name.tr(context: context),
                    fieldValue: data.name ?? "",
                  ),
              
                  DataLine(
                    fieldName:  LocaleKeys.gender.tr(context: context),
                    fieldValue: data.gender ?? "",
                  ),
              
                  DataLine(
                    fieldName:  LocaleKeys.location.tr(context: context),
                    fieldValue: data.location?['name'],
                  ),
              
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}
