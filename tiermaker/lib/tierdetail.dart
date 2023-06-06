import 'package:flutter/material.dart';
import 'custombutton_column_iconlabel.dart';
import 'tier_creation_screen.dart';

// todo メインページが出来次第消す。
void main(){
  runApp(TierDitailScreen());
}

// 表詳細画面を作成する
class TierDitailScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tierdetailpage',
      home: TierDitail(),
    );
  }
}

// 表詳細画面widgetを作成する。
class TierDitail extends StatelessWidget{
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

    void _goToCreationScreen(){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TierCreationScreen()),
      );
    }

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
          CustomButton_Column_Iconlabel(Icons.edit, '編集', colors['icon_label_main']!, _goToCreationScreen),
          CustomButton_Column_Iconlabel(Icons.share, '共有', colors['icon_label_main']!),
          CustomButton_Column_Iconlabel(Icons.file_download_outlined, '保存', colors['icon_label_main']!),
          CustomButton_Column_Iconlabel(Icons.delete_forever, '削除', colors['icon_label_delete']!),
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
          backgroundColor: colors['black_background'],
          // appbar左側ボタン
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            // todo 表一覧画面へ移動する処理を書く
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TierCreationScreen()),
              );
            },
          ),
          title: Text('ここはティア表の名前が入る'),
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
}