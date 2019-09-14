import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController  typeController = TextEditingController();
  String showText = '欢迎您来到美好人间高级会所';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('美好人间'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              TextField(
                controller: typeController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  labelText: '美女类型',
                  helperText: '请输入你喜欢的类型',
                ),
                autofocus: false,
              ),
              RaisedButton(
                onPressed: _choiceAction,
                child: Text('选择完毕'),
              ),
              Text(
                showText,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _choiceAction(){
    print('开始选择你喜欢的类型......');
    if(typeController.text.toString() == '') {
      showDialog(
        context: context,
        builder: (context)=>AlertDialog(title: Text('美女类型不能为空'),)
      );
    }else {
        getHttp(typeController.text.toString()).then((val) {
          setState(() {
            showText = val['data']['name'].toString();
          });
        });
    }
  }

  Future getHttp(String typeText) async {
    try {
      Response response;
      var data = {'name':typeText};
      //https://easy-mock.com/mock/5d7d28156028ae281ebf0aab/brightli/get_test
      //https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian
      response = await Dio().get("https://easy-mock.com/mock/5d7d28156028ae281ebf0aab/brightli/get_test",
          queryParameters: data
      );
      print(response);
      return response.data;
    } catch (e) {
      return print(e);
    }

  }
}
