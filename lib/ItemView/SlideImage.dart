import 'package:flutter/material.dart';

///轮播图点击事件
class SlideImage extends StatelessWidget {
  final String imagePath;

  const SlideImage({Key? key, required this.imagePath,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print('点击了$imagePath');
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

