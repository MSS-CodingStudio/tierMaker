import 'package:flutter/material.dart';

// iconとlabelがColumnになっているボタンのコンポーネント
class CustomButton_Column_Iconlabel extends StatelessWidget {
  // 使用するicon
  final IconData icon;
  // labelの文字
  final String label;
  // iconとlabelの色
  final Color color;
  // ボタンをonPressedした時の処理を記載した関数
  final Function() ? onPressedCallback;

  // コンストラクタ
  CustomButton_Column_Iconlabel(this.icon,this.label,this.color, [this.onPressedCallback]);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        if(onPressedCallback != null){
          onPressedCallback;
        }
        else{
          print(this.label + ' is pressed');
        }
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
