import 'package:flutter/material.dart';

///排行页
class RankingView extends StatefulWidget {
  const RankingView({Key? key}) : super(key: key);

  @override
  State<RankingView> createState() => _RankingViewState();
}

class _RankingViewState extends State<RankingView> {
  int selectedIndex = 0;

  final List<String> items = ['飙升榜', '近七天', '近三十天', '完结榜'];

  final List finishBooks = [];
  final List soaringBooks = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
  final List nearlySevenBooks = [];
  final List nearlyThirtyBooks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Row(
        children: [
          Container(
            width: 80,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            color: Colors.white,
                            child: Container(
                              color: index == selectedIndex
                                  ? Colors.white
                                  : Colors.grey.shade200,
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Visibility(
                                    visible: index == selectedIndex,
                                    child: AnimatedPositioned(
                                      child: Container(
                                        width: 4,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 300),
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    alignment: Alignment.center,
                                    child: Text('${items[index]}'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: selectedIndex,
              children: [
                soaringBooksListViewPage(
                  'assets/images/illustration_1.jpg',
                  '黑猫与牛奶',
                  '瑞星',
                  '连载中',
                ),
                nearlySevenBooksListViewPage(),
                nearlyThirtyBooksListViewPage(),
                finishBooksListViewPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///飙升榜
  Widget soaringBooksListViewPage(
      String image, String title, String author, String text) {
    if (soaringBooks.isNotEmpty) {
      return Container(
        color: Colors.white,
        child: ListView.separated(
            itemCount: soaringBooks.length,
            separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  print('点击了$index');
                },
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    // color: Colors.green,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 150,
                        alignment: Alignment.center,
                        // color: Colors.red,
                        child: Text(
                          '${soaringBooks[index]}',
                          style: TextStyle(
                            fontSize: index < 3 ? 24 : 18,
                            fontWeight:
                                index < 3 ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 150,
                        margin: EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                          // color: Colors.orange,
                          image: DecorationImage(
                            image: AssetImage(image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: 120,
                        height: 150,
                        // color: Colors.grey,
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: 50,
                                // color: Colors.blueAccent,
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  title,
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold),
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                )),
                            Expanded(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(author, style: TextStyle(fontSize: 16)),
                                Text(text, style: TextStyle(fontSize: 16)),
                              ],
                            ),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      );
    } else {
      return Container(
        color: Colors.white,
        child: Center(
          child: Text('暂时没有数据'),
        ),
      );
    }
  }

  ///近七天
  Widget nearlySevenBooksListViewPage() {
    if (nearlySevenBooks.isNotEmpty) {
      return Container(
        color: Colors.white,
        child: ListView.separated(
            itemCount: nearlySevenBooks.length,
            separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
            itemBuilder: (context, index) {
              return Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 150,
                      alignment: Alignment.center,
                      color: Colors.red,
                      child: Text(
                        '${nearlySevenBooks[index]}',
                        style: TextStyle(
                          fontSize: index < 3 ? 24 : 18,
                          fontWeight:
                              index < 3 ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              );
            }),
      );
    } else {
      return Container(
        color: Colors.white,
        child: Center(
          child: Text('暂时没有数据'),
        ),
      );
    }
  }

  ///近三十天
  Widget nearlyThirtyBooksListViewPage() {
    if (nearlyThirtyBooks.isNotEmpty) {
      return Container(
        color: Colors.white,
        child: ListView.separated(
            itemCount: nearlyThirtyBooks.length,
            separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
            itemBuilder: (context, index) {
              return Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 150,
                      alignment: Alignment.center,
                      color: Colors.red,
                      child: Text(
                        '${nearlyThirtyBooks[index]}',
                        style: TextStyle(
                          fontSize: index < 3 ? 24 : 18,
                          fontWeight:
                              index < 3 ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              );
            }),
      );
    } else {
      return Container(
        color: Colors.white,
        child: Center(
          child: Text('暂时没有数据'),
        ),
      );
    }
  }

  //String image,String title,String text,String author
  ///完结榜
  Widget finishBooksListViewPage() {
    if (finishBooks.isNotEmpty) {
      return Container(
        color: Colors.white,
        child: ListView.separated(
            itemCount: finishBooks.length,
            separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
            itemBuilder: (context, index) {
              return Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 150,
                      alignment: Alignment.center,
                      color: Colors.red,
                      child: Text(
                        '${finishBooks[index]}',
                        style: TextStyle(
                          fontSize: index < 3 ? 24 : 18,
                          fontWeight:
                              index < 3 ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              );
            }),
      );
    } else {
      return Container(
        color: Colors.white,
        child: Center(
          child: Text('暂时没有数据'),
        ),
      );
    }
  }
}
