import 'package:flutter/material.dart';
import 'package:time_slip/model/page_model.dart';
import 'package:time_slip/pages/my.dart';
import 'package:time_slip/pages/find.dart';
import 'package:time_slip/pages/group.dart';
import 'package:time_slip/pages/video.dart';
import 'package:time_slip/widgets/navigation_bar.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final PageController pageController = PageController(initialPage: 0);
  int _pageNumber = 0;

  _setPageNumber(int index) {
    setState(() {
      _pageNumber = index;
    });
  }

  Widget body(List<PageModel> pageList) {
    return PageView.builder(
      reverse: false,
      onPageChanged: _setPageNumber,
      controller: pageController,
      itemCount: pageList.length,
      itemBuilder: (BuildContext context, index) {
        final item = pageList[index];
        return Container(
          padding: EdgeInsets.only(top: 50),
          child: SafeArea(bottom: false, child: Container(child: item.widget)),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).padding.top;

    final List<PageModel> pageList = [
      PageModel(
        title: '我的',
        color: Colors.yellow,
        navColor: Colors.transparent,
        widget: MyPage(),
      ),
      PageModel(
        title: '发现',
        color: Colors.yellowAccent,
        navColor: Colors.white,
        widget: FindPage(),
      ),
      PageModel(
        title: '云村',
        color: Colors.blueAccent,
        navColor: Colors.white,
        widget: GroupPage(),
      ),
      PageModel(
        title: '视频',
        color: Colors.blueGrey,
        navColor: Colors.white,
        widget: VideoPage(),
      ),
    ];

    return Scaffold(
      body: Stack(
        children: <Widget>[
          this.body(pageList),
          Positioned(
            child: NavigationBar(
              pageController: pageController,
              pageNumber: _pageNumber,
              pageList: pageList,
              topPadding: topPadding,
            ),
          ),
        ],
      ),
    );
  }
}
