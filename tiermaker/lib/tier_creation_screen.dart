import 'package:flutter/material.dart';
import 'custombutton_column_iconlabel.dart';

class TierCreationScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tiercreationscreen',
      home: TierCreation(),
    );
  }
}

// 表詳細画面widgetを作成する。
class TierCreation extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // デバイスごとの幅と高さを取得
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    // 表詳細画面で使用するカラーコード一覧
    Map<String, Color> colors = {
      'black_background': Color(0xff272727),
      'icon_label_main': Color(0xffffffff),
      'icon_label_delete': Color(0xffff0000),
      'app_title': Color(0xff5A5858),
    };

    // 表詳細画面image部分のwidget
    Widget imageSection = Container(
      // todo 写真サイズを決めていないので仮置きしている。決まり次第widthとheightの値を変更をする。
      width: deviceWidth * 0.75,
      height: deviceHeight * 0.64,
      child: Image.asset('images/sample_tier1.png',
        fit: BoxFit.contain,
      ),
    );

    // tier表詳細画面下部のボタン群のwidget
    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomButton_Column_Iconlabel(
              Icons.add, 'Row', colors['icon_label_main']!),
          CustomButton_Column_Iconlabel(
              Icons.remove, 'Row', colors['icon_label_main']!),
          CustomButton_Column_Iconlabel(
              Icons.folder, '画像一覧', colors['icon_label_main']!),
        ],
      ),
    );

    // 画面下部のロゴwidget
    // todo fontやfontSizeについて、きちんと決定する。
    Widget bottomAppLogoSection = Container(
      alignment: Alignment.center,
      child: Text(
        'tier maker',
        style: TextStyle(
          fontSize: 20,
          color: colors['app_title'],
        ),
      ),
    );


    // 実際の画面構成
    return Scaffold(
      backgroundColor: colors['black_background'],
      appBar: AppBar(
        // 自動で生成されるボタン(戻るボタン)の生成を拒否
        automaticallyImplyLeading: false,
        backgroundColor: colors['black_background'],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          // todo 表一覧画面へ移動する処理を書く
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('ここはティア表の名前が入る'),
        // appbar右側ボタン
        actions: [
          TextButton(
              child: const Text('保存'),
              // todo 画像作成・編集内容を保存する処理を実行する。
              onPressed: () {}
          ),
        ],
        elevation: 0.0,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          imageSection,
          SizedBox(height: 30),
          buttonSection,
          SizedBox(height: 30),
          bottomAppLogoSection,
          SizedBox(height: 30,)
        ],
      ),
    );
  }

  void _call(){
    print('pressed');
  }

}
