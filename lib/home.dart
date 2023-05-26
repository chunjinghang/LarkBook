import 'package:flutter/material.dart';

import 'Page/BookPage.dart';
import 'Page/MePage.dart';
import 'Page/MessagePage.dart';
import 'Page/TabPage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var current = 0; // 定义一个变量 current，用于记录当前显示的页面索引

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IndexedStack 是一个 Widget，可以管理多个子 Widget，并根据 index 显示其中一个子 Widget
      body: IndexedStack(
        index: current, // 当前显示的页面索引
        children: const [
          // 子 Widget 列表
          TabPage(),
          BookPage(),
          MessagePage(),
          MePage(),
        ],
      ),
      // BottomNavigationBar 是一个 Widget，可以显示底部导航栏
      bottomNavigationBar: SizedBox(
        height: 90,
        child: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          // 选中的导航项颜色
          unselectedItemColor: const Color(0xff999999),
          // 未选中的导航项颜色
          type: BottomNavigationBarType.fixed,
          // 设置导航栏类型为 fixed，可以显示多个导航项
          currentIndex: current,
          // 当前选中的导航项索引
          onTap: (index) {
            // 导航项被点击时的回调函数，更新 current 变量的值，并调用 setState 方法刷新界面
            current = index;
            setState(() {
              print(index);
              // print(_bottomNavBarHeight);
            });
          },
          // 导航项列表，包含了四个 BottomNavigationBarItem
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/home.png')),
                label: '首页'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/book.png')),
                label: '书架'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/message.png')),
                label: '消息'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/me.png')),
                label: '我的'),
          ],
        ),
      ),
    );
  }
}