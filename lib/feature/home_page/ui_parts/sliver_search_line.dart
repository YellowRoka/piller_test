import 'package:flutter/material.dart';
import 'package:piller_test/feature/home_page/ui_parts/clear_search_button.dart';
import 'package:piller_test/feature/home_page/ui_parts/search_line_body.dart';
import 'package:piller_test/system/themes/app_themes.dart';

class SliverSearchLine extends StatefulWidget implements PreferredSizeWidget {
  const SliverSearchLine({super.key});
  
  @override
  State<SliverSearchLine> createState() => _SliverSearchLineState();
  
  @override
  Size get preferredSize => Size(400, 75);
}

class _SliverSearchLineState extends State<SliverSearchLine> {
  late SearchController searchController;
  late FocusNode        searchFocusNode;

  @override
  void initState() {
    super.initState();
    searchController = SearchController();
    searchFocusNode  = FocusNode();
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverFloatingHeader(
      child: Container(
        padding: const EdgeInsets.only(
          left:  10,
          right: 10
        ),
        alignment:  Alignment.center,
        decoration: searchLineDecoration,
        height:     140,
        child:      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Icon(Icons.search, size: 35),
            
            const SizedBox(width: 10),
            
            SearchLineBody(
              searchController: searchController,
              searchFocusNode:  searchFocusNode
            ),
            
            const SizedBox(width: 10),
            
            ClearSearchButton(
              searchController: searchController,
              searchFocusNode:  searchFocusNode
            )
          ],
        ),
      ),
    );
  }
}
