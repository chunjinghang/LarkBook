import 'package:flutter/material.dart';

import '../ItemView/DiscoverListView.dart';
import '../TextList.dart';


///精选页
///下拉刷新列表功能未实现
class ChoicenessView extends StatefulWidget {
  const ChoicenessView({Key? key}) : super(key: key);

  @override
  State<ChoicenessView> createState() => _ChoicenessViewState();
}

class _ChoicenessViewState extends State<ChoicenessView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
            itemCount: discoverTitles.length,
            itemBuilder: (BuildContext context, int index) {
          final discoverAuthor =
              discoverAuthors[index % discoverAuthors.length];
          final discoverTitle = discoverTitles[index % discoverTitles.length];
          final discoverText = discoverTexts[index % discoverTexts.length];
          final discoverScore = discoverScores[index % discoverScores.length];
          final discoverImage = discoverImages[index % discoverImages.length];
          return DiscoverListView(
            discoverAuthor: discoverAuthor,
            discoverImage: discoverImage,
            discoverScore: discoverScore,
            discoverText: discoverText,
            discoverTitle: discoverTitle,
          );
        }),
      ),
    );
  }
}
