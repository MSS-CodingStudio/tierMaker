import 'package:flutter/material.dart';

// iconとlabelがColumnになっているボタンのコンポーネント
class CustomButton extends StatefulWidget {
  // 使用するicon
  final IconData icon;
  // labelの文字
  final String label;
  // iconとlabelの色
  final Color color;
  // ボタンをonTapした時の処理を記載した関数
  final VoidCallback ? onTap;

  // コンストラクタ
  const CustomButton({
    required this.icon,
    required this.label,
    required this.color,
    this.onTap
  });
  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton>{
  // ボタンを押下しているかどうか
  bool _pressing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) {
        setState(() {
          _pressing = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _pressing = false;
        });
      },
      onTap: (){
        if(widget.onTap != null){
          widget.onTap!();
        }
        else{
          print(widget.label + ' is pressed');
        }
      },
      onTapCancel: () {
        setState(() {
          _pressing = false;
        });
      },
      // アニメーション付与
      child: AnimatedOpacity(
        // フェードインアウト時の色味設定
          opacity: _pressing ? 0.4 : 1.0,
          // フェード時間
          duration: Duration(milliseconds: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
                widget.icon,
                size: 24,
                color: widget.color
            ),
            Container(
              margin: const EdgeInsets.only(top: 1),
              child: Text(
                widget.label,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: widget.color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
