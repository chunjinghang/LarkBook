import 'package:flutter/material.dart';

///发现页列表
class DiscoverListView extends StatelessWidget {
  final String discoverImage;
  final String discoverTitle;
  final String discoverText;
  final String discoverAuthor;
  final String discoverScore;

  const DiscoverListView({Key? key, required this.discoverImage, required this.discoverTitle, required this.discoverText, required this.discoverAuthor, required this.discoverScore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print('点击了作品');
      },
      child: Container(
        margin: EdgeInsets.only(top: 20),
        width: double.infinity,
        height: 220,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 35,
              child: Container(
                width: 320,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), //阴影颜色
                      spreadRadius: 2, //阴影扩散面积
                      blurRadius: 5, //阴影模糊程度
                      offset: Offset(0, 3), //阴影偏移量，可以调整阴影的位置
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      child: Container(
                        width: 220,
                        height: 160,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Text(discoverTitle,
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              discoverText,
                              softWrap: true,
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: 320,
                        height: 50,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10),
                                width: 100,
                                height: 30,
                                child: Row(
                                  children: [
                                    Text('作者:',style: TextStyle(fontSize: 16),),
                                    Text(discoverAuthor,style: TextStyle(fontSize: 16),),
                                  ],
                                )
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 100),
                              width: 100,
                              height: 30,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('评分:',style: TextStyle(fontSize: 16),),
                                  Text(discoverScore,style: TextStyle(color: Colors.redAccent,fontSize: 18),),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 10,
              child: Container(
                width: 120,
                height: 160,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 1),
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(discoverImage),
                      //assets/images/illustration_1.jpg
                      fit: BoxFit.fill,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
