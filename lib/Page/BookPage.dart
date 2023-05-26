import 'package:flutter/material.dart';

import '../ItemView/BookPageItem.dart';
import '../TabBarView/ClassificationView.dart';

class BookPage extends StatefulWidget {
  const BookPage({Key? key}) : super(key: key);

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {

  final List books = ['0','1','2','3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Container(alignment: Alignment.topLeft, child: Row(
          children: [
            Text('我的书架'),
            Text('${books.length}')
          ],
        )),
        actions: [
          PopupMenuButton<String>(
            child: Container(
              alignment: Alignment.center,
                margin: EdgeInsets.only(right: 20),
                child: Text('编辑',
                        style: TextStyle(
                          fontSize: 18,
                        ),)),
            itemBuilder: (BuildContext context) {
              return const[
                PopupMenuItem<String>(
                  value: '按添加时间排序',
                  child: Text('按添加时间排序'),
                ),
                PopupMenuItem<String>(
                  value: '按更新时间排序',
                  child: Text('按更新时间排序'),
                ),
                PopupMenuItem<String>(
                  value: '按阅读时间排序',
                  child: Text('按阅读时间排序'),
                ),
                PopupMenuItem<String>(
                  value: '管理',
                  child: Text('管理'),
                ),
              ];
            },
            onSelected: (String value) {
              // 处理选择的标签
              switch (value) {
                case '按添加时间排序':
                // 处理按添加时间排序的逻辑
                  break;
                case '按更新时间排序':
                // 处理按更新时间排序的逻辑
                  break;
                case '按阅读时间排序':
                // 处理按阅读时间排序的逻辑
                  break;
                case '管理':
                // 处理管理的逻辑
                  break;
              }
            },
          ),
        ],
      ),
      body: GridView.builder(
          scrollDirection: Axis.vertical,
          itemCount: books.length + 1,
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:3,
              childAspectRatio: .6,
              crossAxisSpacing: 10,
            mainAxisSpacing: 10
          ), itemBuilder: (context,index){
            if(index == books.length){ //判断index是否到达最后一个位置
              ///在最后一个位置显示添加书籍的Container
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){return ClassificationView();}));
                  ///可以添加更新书籍列表功能(具体的效果：点击跳转到分类页，选择想要添加的书籍)
                  // setState((){});
                },
                child: Container(
                  height: 120,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 0,
                        offset: Offset(2,2),
                        blurRadius: 4,
                      ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Icon(Icons.add,size: 36,color: Colors.grey,),
                ),
              );
            }
        return BookPageItem(itemText: '第112话', itemPath: 'assets/images/wotui.png',itemTitle: '我推的孩子',itemUpdateTime: '2023-5-18',);
      }),
    );
  }
}
