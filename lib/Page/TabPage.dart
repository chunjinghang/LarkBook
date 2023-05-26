import 'package:flutter/material.dart';
import 'package:larkbook/ItemView/SearchView.dart';

import '../TabBarView/ClassificationView.dart';
import '../TabBarView/ChoicenessView.dart';
import '../TabBarView/RankingView.dart';
import '../TabBarView/RecommendView.dart';
import '../TabBarView/SocialCircleView.dart';

///顶部导航页
class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with SingleTickerProviderStateMixin {
  final categories = ['推荐', '精选', '圈子', '排行'];
  late final tabCtl = TabController(length: categories.length, vsync: this);
  final List<Widget> _tabViews = const [
    RecommendView(),
    ChoicenessView(),
    SocialCircleView(),
    RankingView(),
  ];

  // final TextEditingController _searchQueryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 2,
        toolbarHeight: 40,
        title: Align(
          alignment: Alignment.centerLeft,
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context)=>SearchView()));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              height: 35,
              width: 260,
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  ImageIcon(
                    AssetImage('assets/images/search.png'),
                    color: Colors.grey,
                  ),
                  Text(
                    '搜索',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ),
        actions: [
          Container(
            width: 30,
            height: 30,
            margin: const EdgeInsets.only(right: 30),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ClassificationView();
                }));
              },
              child: const ImageIcon(AssetImage('assets/images/class.png')),
            ),
          ),
        ],
        bottom: TabBar(
          controller: tabCtl,
          physics: const BouncingScrollPhysics(),
          isScrollable: true,
          unselectedLabelColor: const Color(0xcdffffff),
          labelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.white,
          tabs: categories
              .map((category) => Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Text(
                        category,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
          ).toList(),
        ),
      ),
      body: TabBarView(
          physics: const BouncingScrollPhysics(),
          controller: tabCtl,
          children: _tabViews),
    );
  }
}
