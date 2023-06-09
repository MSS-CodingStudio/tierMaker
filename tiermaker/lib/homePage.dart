import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State with SingleTickerProviderStateMixin {
  // ページ切替え用コントローラ
  late PageController _pageController;

  // ページインデックス
  int _screen = 0;

  // タイトル
  var _title = '表一覧';

  @override
  void initState() {
    super.initState();
    // コントローラ作成
    _pageController = PageController(initialPage: _screen);
  }

  @override
  void dispose() {
    super.dispose();
    // コントローラ破棄
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF272727),
      // ヘッダ
      appBar: AppBar(
        backgroundColor: const Color(0xFF272727),
        elevation: 0,
        title: Text(_title),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.help_outline,
            color: Color(0xFF00A3FF),
            size: 30,
          ),
        ),
      ),
      // ページ
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _screen = index;
          });
        },
        // ページの内容
        children: const [
          tierList(),
          imageFolder(),
        ],
      ),
      // フッタ
      bottomNavigationBar: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          BottomNavigationBar(
            selectedItemColor: const Color(0xFFFFFFFF),
            unselectedItemColor: const Color(0xFF555555),
            backgroundColor: const Color(0xFF272727),
            currentIndex: _screen,
            onTap: (index) {
              setState(() {
                _screen = index;
                // タイトル切替え
                if (_screen == 0) {
                  _title = '表一覧';
                } else {
                  _title = '画像フォルダ';
                }
                // ページ切替えアニメーション
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              });
            },
            // タブボタン
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.list_alt),
                label: '表一覧',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.folder),
                label: '画像フォルダ',
              ),
            ],
          ),
          // 追加ボタン
          FloatingActionButton(
            onPressed: () {},
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: FractionalOffset.bottomLeft,
                    end: FractionalOffset.topRight,
                    colors: [Color(0xFFCB0E52), Color(0xFFE80F91)],
                  )),
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}

// 表一覧ページ内容
class tierList extends StatelessWidget {
  const tierList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF272727),
      body: Center(child: Icon(Icons.list_alt)),
    );
  }
}

// 画像フォルダページ内容
class imageFolder extends StatelessWidget {
  const imageFolder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF272727),
      body: Center(child: Icon(Icons.folder)),
    );
  }
}
