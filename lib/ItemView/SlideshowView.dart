import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:larkbook/ItemView/SlideImage.dart';


///推荐页轮播图
class SlideshowView extends StatefulWidget {
  const SlideshowView({Key? key}) : super(key: key);

  @override
  State<SlideshowView> createState() => _SlideshowViewState();
}

class _SlideshowViewState extends State<SlideshowView> {
  // final int _currentIndex = 0;
  final List<Widget> _slideshow = [
    SlideImage(imagePath:'assets/images/acg_1.jpg'),
    SlideImage(imagePath:'assets/images/acg_2.png'),
    SlideImage(imagePath:'assets/images/acg_3.jpg'),
    SlideImage(imagePath:'assets/images/acg_4.jpg'),

  ];

  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: sizeHeight * 0.01),
        child: SizedBox.fromSize(
          size: const Size.fromHeight(180.0),
          child: Swiper(
            itemBuilder: (context,index) {
              return _slideshow[index];
            },
            itemCount: _slideshow.length,
            viewportFraction: 0.8,
            scale: 0.85,
          ),
        ),
      ),
    );
  }
}
