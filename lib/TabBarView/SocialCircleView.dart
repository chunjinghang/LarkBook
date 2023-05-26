import 'package:flutter/material.dart';

///社交圈页
class SocialCircleView extends StatefulWidget {
  const SocialCircleView({Key? key}) : super(key: key);

  @override
  State<SocialCircleView> createState() => _SocialCircleViewState();
}

class _SocialCircleViewState extends State<SocialCircleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(.1),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return PaperView();
          }),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      // ),
    );
  }
}

///封装数据(待整理)
class PaperView extends StatelessWidget {
  // final String image;
  // final String text;
  // final String headPicture;
  // final String userName;
  const PaperView({
    Key? key,
    // required this.text,
    // required this.image,
    // required this.headPicture,
    // required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      color: Colors.white,
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                margin: EdgeInsets.only(left: 5,top: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey),
              ),
              SizedBox(width: 10),
              Container(
                width: 280,
                height: 60,
                // color: Colors.green,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '用户名',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Row(
                        children: [
                          Text('2023-05-24'),
                          SizedBox(width: 10),
                          Text('20:30'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  print('点击了向下箭头');
                },
                child: Container(
                  width: 30,
                  height: 20,
                  decoration: const BoxDecoration(
                    // color: Colors.cyan,
                      image: DecorationImage(
                        image: AssetImage('assets/images/down_arrow .png'),
                      ),
                  ),
                ),
              )
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 140,
            padding: EdgeInsets.only(left: 6,right: 6),
            // color: Colors.orange,
            child: Text('小黑猫只是一只小黑猫，它没有喝过幸福的牛奶；小男孩只是一个小男孩，没有过去也没有未来；在一个樱花盛开晚风徐徐的夜晚，小黑猫遇上了小男孩，小男孩给了它一碗温温的牛奶。小黑猫只是一只小黑猫，它没有喝过幸福的牛奶；小男孩只是一个小男孩，没有过去也没有未来；在一个樱花盛开晚风徐徐的夜晚，小黑猫遇上了小男孩，小男孩给了它一碗温温的牛奶。',style: TextStyle(
              fontSize: 16,
            ),overflow: TextOverflow.ellipsis,softWrap: true,maxLines: 6,),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            child: Row(
              children: [
                Expanded(child: Container(padding:EdgeInsets.all(5),child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Image(image: AssetImage('assets/images/icon/share.png')),
                    SizedBox(width: 5),
                    Text('0'),
                  ],
                ))),
                Expanded(child: Container(padding:EdgeInsets.all(5),child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:const [
                    Image(image: AssetImage('assets/images/icon/comment.png')),
                    SizedBox(width: 5),
                    Text('0'),
                  ],
                ))),
                Expanded(child: Container(padding:EdgeInsets.all(5),child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const[
                    Image(image: AssetImage('assets/images/icon/like.png')),
                    SizedBox(width: 5),
                    Text('0'),
                  ],
                ))),
              ],
            ),
          )
        ],
      ),
    );
  }
}
