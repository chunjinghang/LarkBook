import 'package:flutter/material.dart';

import '../ItemView/CardView.dart';
import '../ItemView/CustomContainer.dart';
import '../ItemView/SlideshowView.dart';
import '../TextList.dart';

///推荐页
class RecommendView extends StatefulWidget {
  const RecommendView({Key? key}) : super(key: key);

  @override
  State<RecommendView> createState() => _RecommendViewState();
}

class _RecommendViewState extends State<RecommendView> {


  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;
    var sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //轮播图
            SizedBox(
              width: sizeWidth,
              height: 200,
              child: const SlideshowView(),
            ),
            //今日推荐栏
            Container(
              margin: EdgeInsets.only(top: sizeHeight * 0.01),
              width: sizeWidth,
              height: 280,
              color: Colors.white,
              // decoration: BoxDecoration(color: Colors.grey),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 5),
                    alignment: Alignment.topLeft,
                    child: const Text(
                      '热门推荐',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    width: sizeWidth,
                    height: 240,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: PageScrollPhysics(),
                      itemCount: 9,
                      itemBuilder: (BuildContext context, int index) {
                        final cardImagePath = cardImagePaths[index % cardImagePaths.length];
                        final cardText = cardTexts[index % cardTexts.length];
                        final cardTitle = cardTitles[index % cardTitles.length];
                        return CardView(
                          cardImagePath: cardImagePath,
                          cardText: cardText ,
                          cardTitle: cardTitle,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            //列表
            Container(
              margin: EdgeInsets.only(top: 10),
              color: Colors.white,
              child: ListView.builder(
                  itemCount: 8,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    final title = titles[index % titles.length];
                    final text = texts[index % texts.length];
                    final imagePath = imagePaths[index % imagePaths.length];
                    return CustomContainer(
                        title: title, text: text, imagePath: imagePath);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
