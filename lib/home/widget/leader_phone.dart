import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// created by brightli on 2019.9.21.2:45.
/// function: 拨打电话

class LeaderPhone extends StatelessWidget {
  final String leaderImage; //店长图片
  final String leaderPhone; //店长电话

  LeaderPhone({Key key,this.leaderImage,this.leaderPhone}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: _launchURL,
        child: Image.network(leaderImage),
      ),
    );
  }

  void _launchURL() async {
    String url = 'tel:' + leaderPhone;
    //String url = 'http://jspang.com';
    if(await canLaunch(url)){
      await launch(url);
    } else {
      throw 'url不能访问-异常';
    }
  }
}
