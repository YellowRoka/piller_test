import 'package:flutter/material.dart';
import 'package:piller_test/feature/home_page/ui_parts/message_card.dart';

class SliverMessageCard extends StatelessWidget {
  final String? message;
  final bool    isRefeshEnabled;
  const SliverMessageCard({super.key, required this.message, this.isRefeshEnabled = false});

  @override
  Widget build(BuildContext context) => SliverToBoxAdapter( 
    child: MessageCard(
      message:          message,
      isRefreshEnabled: isRefeshEnabled
    )
  );
}
