import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage>
    with SingleTickerProviderStateMixin {
  final msgList = ['回复我的', '收到的赞', '系统通知'];
  late final tabCrl = TabController(length: msgList.length, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的消息'),
        elevation: 2,
        actions: [
          GestureDetector(
            onTap: (){
              _showSnackBar(context, '已将全部消息改为已读');
            },
            child: Container(
              width: 25,
              height: 25,
              margin: EdgeInsets.only(right: 20),
              child: Image(
                image: AssetImage('assets/images/clear.png'),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          TabBar(
              labelColor: Colors.black,
              labelStyle: TextStyle(
                fontSize: 16,
              ),
              unselectedLabelColor: Colors.black.withOpacity(.5),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.black54,
              controller: tabCrl,
              tabs: msgList
                  .map((e) => Center(
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                          child: Text(e),
                        ),
                      ))
                  .toList()),
          Expanded(
            child: TabBarView(
              controller: tabCrl,
              physics: BouncingScrollPhysics(),
              children: [
                MsgContainer(text: '怎么还没有收到回复'),
                MsgContainer(text: '为什么不给我点赞'),
                MsgContainer(text: '暂时没有系统通知'),
              ],
            ),
          ),
        ],
      ),
    );
  }
  ///底部消息提示
  void _showSnackBar(BuildContext context, String message){
    final snackBar = SnackBar(content: Text(message,textAlign: TextAlign.center,),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.grey,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class MsgContainer extends StatelessWidget {
  final String text;

  const MsgContainer({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey
        ),
      ),
    );
  }
}
