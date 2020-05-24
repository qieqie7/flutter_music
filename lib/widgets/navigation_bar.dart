import 'package:flutter/material.dart';
import 'package:time_slip/model/page_model.dart';

class NavigationBar extends StatelessWidget {
  final List<PageModel> pageList;
  final double topPadding;
  final PageController pageController;
  final int pageNumber;

  NavigationBar({
    this.pageNumber,
    this.pageController,
    this.pageList,
    this.topPadding,
  }) : super();

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pageNav = [];
    pageList.asMap().forEach((index, page) {
      final String title = page.title;
      _pageNav.add(GestureDetector(
        child: Container(
          child: Text(title),
        ),
        onTap: () {
          this.pageController.jumpToPage(index);
        },
      ));
    });

    return Container(
      height: topPadding + 50,
      padding: EdgeInsets.only(top: topPadding),
      color: pageList[pageNumber].navColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _pageNav,
      ),
    );
  }
}
