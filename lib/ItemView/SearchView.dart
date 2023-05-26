import 'package:flutter/material.dart';
import 'package:larkbook/Page/TabPage.dart';


///搜索页
class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  String labelText = '搜索';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        setState(() {
          labelText = '搜索';
        });
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          automaticallyImplyLeading: false,
          title: Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  height: 35,
                  width: 300,
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageIcon(
                        AssetImage('assets/images/search.png'),
                        color: Colors.grey,
                      ),
                      Container(
                        width: 250,
                        height: 30,
                        margin: EdgeInsets.only(left: 5, top: 5),
                        // color: Colors.redAccent,
                        child: TextField(
                          onTap: () {
                            setState(() {
                              labelText = '';
                            });
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: labelText,
                            labelStyle:
                                TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                          cursorColor: Colors.grey,
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context, MaterialPageRoute(builder: (context)=> TabPage()));
                  },
                  child: Text('取消'),
                ),
              ],
            ),
          ),
        ),
        // body: Container(
        //   color: Colors.blue,
        //   width: MediaQuery.of(context).size.width,
        //   height: 120,
        //   child: Row(
        //     children: [
        //       Container(
        //         margin: EdgeInsets.only(top: 10,left: 10),
        //         decoration: BoxDecoration(
        //           color: Colors.white,
        //           borderRadius: BorderRadius.circular(25),
        //         ),
        //         height: 35,
        //         width: 300,
        //         padding: const EdgeInsets.only(
        //           left: 10,
        //         ),
        //         child: Row(
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children:  [
        //             ImageIcon(
        //               AssetImage('assets/images/search.png'),
        //               color: Colors.grey,
        //             ),
        //             Container(
        //               width: 250,
        //               height: 30,
        //               margin: EdgeInsets.only(left: 5),
        //               // color: Colors.redAccent,
        //               child: TextField(
        //                 decoration: InputDecoration(
        //                   border: InputBorder.none,
        //                   // labelStyle: TextStyle(fontSize: 20,color: Colors.grey),
        //                 ),
        //                 cursorColor: Colors.grey,
        //                 maxLines: 1,
        //                 textAlign: TextAlign.start,
        //                 style: TextStyle(fontSize: 20),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //       Text('搜索')
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
