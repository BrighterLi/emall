import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:emall/home/widget/top_navigator.dart';

import '../service/service_method.dart';
import 'widget/custom_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String homePageContent = '正在获取数据';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('百姓生活+'),
        ),
        body: FutureBuilder(
          future: getHomePageContent(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              ///数据处理
              var data = json.decode(snapshot.data.toString());
              List<Map> swiperDataList =
                  (data['data']['slides'] as List).cast();
              List<Map> navgatorList = (data['data']['category'] as List).cast();

              return Column(
                children: <Widget>[
                  CustomSwiper(
                    swiperDataList: swiperDataList,
                  ),
                  TopNavigator(navigatorList: navgatorList,)
                ],
              );
            } else {
              return Center(
                child: Text('加载中'),
              );
            }
          },
        ));
  }
}
