import 'package:flutter/material.dart';

/// created by brightli on 2019.9.21.2:16.
/// function: 广告牌

class AdBanner extends StatelessWidget {
  final String adPicture;

  AdBanner({Key key,this.adPicture}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(adPicture),
    );
  }
}
