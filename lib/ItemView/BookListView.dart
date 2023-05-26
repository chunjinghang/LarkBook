import 'package:flutter/material.dart';

///书籍列表

class Book extends StatelessWidget {
  final String title;
  final String label;
  final String bookImagePath;
  final String date;

  const Book(
      {Key? key,
      required this.title,
      required this.bookImagePath,
      required this.label, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5), topRight: Radius.circular(5)),
        ),
        child: Column(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                image: DecorationImage(
                  image: AssetImage(bookImagePath),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              // color: Colors.greenAccent,
              width: 120,
              margin: EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 120,
                      height: 40,
                      child: Text(title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),softWrap: true,)),
                  SizedBox(height: 5,),
                  Text(label),
                  SizedBox(height: 5,),
                  Text(date),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
