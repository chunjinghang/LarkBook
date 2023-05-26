import 'package:flutter/material.dart';

class BookPageItem extends StatelessWidget {
  final String itemPath;
  final String itemTitle;
  final String itemUpdateTime;
  final String itemText;

  const BookPageItem(
      {Key? key, required this.itemPath, required this.itemTitle, required this.itemUpdateTime, required this.itemText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(
          color: Colors.grey,
          spreadRadius: 0,
          offset: Offset(2,2),
          blurRadius: 4,
        ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      // color: Colors.red,
      child:Column(
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),
              image: DecorationImage(
                image: AssetImage(itemPath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            // color: Colors.blue,
            alignment: Alignment.centerLeft,
            child: Text(itemTitle,overflow: TextOverflow.ellipsis,style: TextStyle(
              fontSize: 18,fontWeight: FontWeight.bold
            ),),
          ),
          Container(
            // color: Colors.greenAccent,
            alignment: Alignment.centerLeft,
            child: Text(itemUpdateTime,style: TextStyle(
              fontSize: 16
            ),),
          ),
          Container(
            // color: Colors.orange,
            alignment: Alignment.centerLeft,
            child: Text(itemText,style: TextStyle(
              fontSize: 16,
            ),),
          )
        ],
      ),
    );
  }
}
