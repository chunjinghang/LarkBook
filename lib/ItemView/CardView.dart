import 'package:flutter/material.dart';

///热门推荐列表
class CardView extends StatelessWidget {
  final String cardImagePath;
  final String cardText;
  final String cardTitle;

  const CardView(
      {Key? key,
      required this.cardImagePath,
      required this.cardText,
      required this.cardTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Container(
        width: 120,
        child: Column(
          children: [
            Container(
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),
              image: DecorationImage(
                image: AssetImage(cardImagePath),
                fit: BoxFit.fill,
              )
            ),),
            Container(
              width: 120,
              // height: 80,
              margin: EdgeInsets.only(top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 120,
                    height: 40,
                    child: Text(cardTitle,style: TextStyle(
                      fontSize: 16,fontWeight: FontWeight.bold
                    ),softWrap: true,),
                  ),
                  SizedBox(height: 10),
                  Text(cardText,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
