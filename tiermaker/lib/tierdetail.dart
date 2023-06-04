import 'package:flutter/material.dart';

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
          _buildButtonColumn(colors['icon_label_main']!, Icons.edit, '編集'),
          _buildButtonColumn(colors['icon_label_main']!, Icons.share, '共有'),
          _buildButtonColumn(colors['icon_label_main']!, Icons.file_download_outlined, '保存'),
          _buildButtonColumn(colors['icon_label_delete']!, Icons.delete_forever_outlined, '削除')
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
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            // todo 表一覧画面へ移動する処理を書く
            onPressed: () {},
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




  // アイコンボタンウィジェットのchildを生成する
  // color: アイコンとラベルの色
  // icon: GoogleMaterialアイコン画像
  // label: アイコン下部にある文字
  // Todo fontやfontSizeについて、きちんと決定する。
  ElevatedButton _buildButtonColumn(Color color, IconData icon, String label) {
    return ElevatedButton(
      // Todo ここに各ボタン押下時の挙動を記載。
      onPressed: (){
        print(label + 'pressed');
      },
      style: ElevatedButton.styleFrom(
        //　ボタンの影を消す
        elevation: 0,
        // ボタンの背景色を画面の背景と同じにする
        backgroundColor: Color(0xff272727)
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
              icon,
              size: 24,
              color: color
          ),
          Container(
            margin: const EdgeInsets.only(top: 1),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}