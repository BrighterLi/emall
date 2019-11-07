import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

/// created by brightli on 2019.9.19.1:00.
/// function: top navigator widget

class TopNavigator extends StatelessWidget {
  final List navigatorList;

  TopNavigator({Key key,this.navigatorList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(this.navigatorList.length>10) {
      this.navigatorList.removeRange(10, this.navigatorList.length);
    }
    return Container(
      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        crossAxisCount: 5,
        padding:EdgeInsets.all(5.0),
        children: navigatorList.map((item){     //遍历List
          return _gridViewItemUI(context, item);
        }).toList(),
      ),
    );
  }
//
  Widget _gridViewItemUI(BuildContext context,item) {
    return InkWell(
      onTap: (){print('点击了导航');},
      child: Column(
        children: <Widget>[
          Image.network(item['image'],width: ScreenUtil().setWidth(95),),
          Text(item['mallCategoryName'])
        ],
      ),
    );
  }
}
