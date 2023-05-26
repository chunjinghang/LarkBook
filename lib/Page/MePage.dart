import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MePage extends StatefulWidget {
  const MePage({Key? key}) : super(key: key);

  @override
  State<MePage> createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  final dynamic = 0;
  final attention = 0;
  final fans = 0;

  final List<String> imagePaths = [
    'assets/images/icon/wallet.png',
    'assets/images/icon/clothes_blue.png',
    'assets/images/icon/dataTraffic.png',
    'assets/images/icon/Community.png',
    'assets/images/icon/teenMode.png',
    'assets/images/icon/helpCenter.png',
    'assets/images/icon/feedback.png',];
  final List labels = [
    '我的钱包',
    '个性装扮',
    '免流量服务',
    '社区中心',
    '青少年模式',
    '帮助中心',
    '意见反馈',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      ///顶部导航
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          ///添加三个功能按钮
          actions: [
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              child: Container(
                width: 25,
                height: 25,
                margin: EdgeInsets.only(right: 15),
                child: Image(
                  image: AssetImage('assets/images/scanner_black.png'),
                ),
              ),
              onTap: () {
                print('点击了扫码按钮');
              },
            ),
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              child: Container(
                width: 25,
                height: 25,
                margin: EdgeInsets.only(right: 15),
                child: Image(
                  image: AssetImage('assets/images/clothes_black.png'),
                ),
              ),
              onTap: () {
                print('点击了主题按钮');
              },
            ),
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              child: Container(
                width: 25,
                height: 25,
                margin: EdgeInsets.only(right: 10),
                child: Image(
                  image: AssetImage('assets/images/set_black.png'),
                ),
              ),
              onTap: () {
                print('点击了设置按钮');
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///用户信息卡片
            Container(
              // color: Colors.grey,
              height: MediaQuery.of(context).size.height * .28,
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    margin: EdgeInsets.only(top: 15, right: 15, left: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 2),
                            color: Colors.grey.withOpacity(.3),
                            spreadRadius: 1,
                            blurRadius: 5),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 260,
                              height: 90,
                              margin: EdgeInsets.only(left: 100),
                              // color: Colors.grey,
                              child: Row(
                                children: [
                                  Container(
                                    width: 220,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        SizedBox(height: 10),
                                        ///用户名
                                        Text(
                                          '用户123',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 20),
                                        ///个性签名
                                        Text(
                                          '生活就是一种态度',
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    ),
                                  ),
                                  ///用户信息详情页跳转
                                  Expanded(
                                      child: Container(
                                          height: 20,
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/right_black.png'),
                                          ))),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        ///用户的一些数据信息
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  ExpandedView(text: '动态',num: '$dynamic',),
                                  Container(width: 1,height:30,color: Colors.grey),
                                  ExpandedView(text: '关注',num: '$attention',),
                                  Container(width: 1,height:30,color: Colors.grey),
                                  ExpandedView(text: '粉丝',num: '$fans',),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ///用户头像
                  Positioned(
                    top: 8,
                    left: 25,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                          image: AssetImage('assets/images/illustration_5.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 35,
                      bottom: 0,
                      child: GestureDetector(
                        onTap: (){
                          print('前往会员中心');
                      },
                        child: Container(
                          width: 320,
                          height:50,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade200,
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 15),
                                width:30,
                                height: 30,
                                child: Image(image: AssetImage('assets/images/member.png'),),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text('我的会员',style: TextStyle(color: Colors.white,fontSize: 16)),
                                    Text('精彩内容抢先看',style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                      height: 20,
                                      padding: EdgeInsets.only(right: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: const[
                                          Text('会员中心',style: TextStyle(color: Colors.white,fontSize: 16),),
                                          SizedBox(
                                            height: 15,
                                            child: Image(
                                              image: AssetImage('assets/images/right.png'),
                                            ),
                                          ),
                                        ],
                                      ),
                                  ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              margin: EdgeInsets.only(top: 15, right: 15, left: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child:Row(
                children: [
                  FunctionBtn(iconPath: 'assets/images/icon/download.png',text: '离线缓存', onTap: () {
                    print('进入离线缓存页面');
                    },),
                  FunctionBtn(iconPath: 'assets/images/icon/record.png',text: '最近阅读', onTap: () {
                    print('进入最近阅读页面');
                    },),
                  FunctionBtn(iconPath: 'assets/images/icon/collect.png',text: '我的收藏', onTap: () {
                    print('进入我的收藏页面');
                    },),
                  FunctionBtn(iconPath: 'assets/images/icon/creation.png',text: '创作中心', onTap: () {
                    print('进入创作中心页面');
                    },),
                ],
              ),
            ),
            Container(
              width: 300,
              height: 1,
              color: Colors.grey.withOpacity(.5),
              margin: EdgeInsets.only(top: 10),
            ),
            Container(
              height: 200,
              margin: EdgeInsets.only(top: 10, right: 15, left: 15),
              decoration: BoxDecoration(
                // color: Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: GridView.count(
                  crossAxisCount: 4,
                  physics: NeverScrollableScrollPhysics(),
                  children: List.generate(imagePaths.length, (index){
                    return GestureDetector(
                      onTap: (){
                        navigateToPage(context, index);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height:40,
                              child: Image(image: AssetImage('${imagePaths[index]}'))),
                          Text(labels[index],style: TextStyle(fontSize: 16),)
                        ],
                      ),
                    );
                  }),
              ),
            ),
          ],
        ),
      ),
    );
  }
  ///根据索引跳转到对应页面
  void navigateToPage(BuildContext context, int index){
    switch(index){
      case 0:
        print('进入我的钱包');
        break;
      case 1:
        print('进入个性装扮');
        break;
      case 2:
        print('进入免流量服务');
        break;
      case 3:
        print('进入社区中心');
        break;
      case 4:
        print('进入青少年模式');
        break;
      case 5:
        print('进入帮助中心');
        break;
      case 6:
        print('进入意见反馈');
        break;
    }
  }
}
///用户的动态、关注、粉丝组件的封装
class ExpandedView extends StatelessWidget {
  final String text;
  final String num;
  const ExpandedView({Key? key, required this.text, required this.num}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(width: 100,height: 60,padding: EdgeInsets.only(top: 5),
      child: Column(
        children: [
          Text(num,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
          Text(text,style: TextStyle(fontSize: 18,),),
        ],
      ),
    ),);
  }
}
///封装功能按钮
class FunctionBtn extends StatelessWidget {
  final String iconPath;
  final String text;
  final Function() onTap;
  const FunctionBtn({Key? key, required this.iconPath, required this.text, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
              child: Image(
                image: AssetImage(iconPath),
              ),
            ),
            Text(text,style: TextStyle(
              fontSize: 16
            ),)
          ],
        ),
      ),
    );
  }
}


