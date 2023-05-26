import 'package:flutter/material.dart';

import '../ItemView/BookListView.dart';
import '../TextList.dart';

///分类页
class ClassificationView extends StatefulWidget {
  const ClassificationView({Key? key}) : super(key: key);

  @override
  State<ClassificationView> createState() => _ClassificationViewState();
}

class _ClassificationViewState extends State<ClassificationView> {


  @override
  Widget build(BuildContext context) {
    Widget indexes = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Indexes(
          text: '综合排序',
          dataList: comprehensive,
        ),
        Indexes(
          text: '全部风格',
          dataList: style,
        ),
        Indexes(
          text: '完结状态',
          dataList: state,
        ),
        Indexes(
          text: '字数',
          dataList: wordNum,
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('分类'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 220,
              // color: Colors.grey,
              child: indexes,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: Colors.grey.shade300,
            ),
            SizedBox(height: 10),
            GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: bookImagePaths_2.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: .5),
                itemBuilder: (BuildContext context, int index) {
                  final title = bookTitles_2[index % titles.length];
                  final bookImagePath = bookImagePaths_2[index % bookImagePaths_2.length];
                  final label = bookLabels[index % bookLabels.length];
                  final date = dates[index % dates.length];
                  return Book(
                    title: title,
                    bookImagePath: bookImagePath,
                    label: label,
                    date: date,
                  );
                }),
          ],
        ),
      ),
    );
  }
}

///标签索引项
class Indexes extends StatelessWidget {
  final String text;
  final List dataList;

  const Indexes({Key? key, required this.text, required this.dataList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 10),
      child: Row(
        children: [
          Container(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0089FF)),
            ),
            width: 80,
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xffC1E2FF),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: PageScrollPhysics(),
            child: Container(
              margin: EdgeInsets.only(left: 12),
              width: MediaQuery.of(context).size.width * 0.7,
              height: 30,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dataList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: GestureDetector(
                          onTap: () {
                            print('点击了${dataList[index]}');
                          },
                          child: Text(
                            dataList[index],
                            style: TextStyle(fontSize: 16),
                          )),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
