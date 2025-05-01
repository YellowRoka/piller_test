import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:piller_test/data/service/home_service/model/home_data_model.dart';
import 'package:piller_test/feature/common_widgets/data_line.dart';
import 'package:piller_test/feature/details_page/ui_parts/hero_image.dart';
import 'package:piller_test/generated/locale_keys.g.dart';

class DetailedDataCard extends StatelessWidget {
  final HomeDataModel data;
  const DetailedDataCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child:  Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child:   ListView(
            shrinkWrap: false,
            children:[

              HeroImage(data),
              const Divider(),

              DataLine(
                fieldName:  LocaleKeys.name.tr(context: context),
                fieldValue: data.name ?? "-",
              ),
              const Divider(),

              DataLine(
                fieldName:  LocaleKeys.gender.tr(context: context),
                fieldValue: data.gender ?? "---",
              ),
              const Divider(),

              DataLine(
                fieldName:  LocaleKeys.status.tr(context: context),
                fieldValue: data.status ?? "---",
              ),
              const Divider(),

              DataLine(
                fieldName:  LocaleKeys.species.tr(context: context),
                fieldValue: data.species ?? "---",
              ),
              const Divider(),
              
              DataLine(
                fieldName:  LocaleKeys.type.tr(context: context),
                fieldValue: data.type ?? "---",
              ),
              const Divider(),
             
              DataLine(
                fieldName:  LocaleKeys.location.tr(context: context),
                fieldValue: "---",
              ),
              const Divider(),
            ]
          ),  
        ),
      ),
    );
  }
}
