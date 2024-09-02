import 'package:damoim/config/component/default_layout.dart';
import 'package:damoim/config/style/color.dart';
import 'package:damoim/features/home/screens/home_list_screen.dart';
import 'package:damoim/features/home/screens/home_map_screen.dart';
import 'package:damoim/features/home/screens/home_my_group_screen.dart';
import 'package:damoim/features/home/screens/home_search_screen.dart';
import 'package:flutter/material.dart';

class HomeRoot extends StatefulWidget {
  const HomeRoot({super.key});

  @override
  State<HomeRoot> createState() => _HomeRootState();
}

class _HomeRootState extends State<HomeRoot> with SingleTickerProviderStateMixin {
  late TabController _controller;
  int index = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
    _controller.addListener(tabListener);
  }

  void tabListener() {
    setState(() {
      index = _controller.index;
    });
  }

  @override
  void dispose() {
    _controller.removeListener(tabListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Da Order',
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: RED_01,
        unselectedItemColor: GRAY_04,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          _controller.animateTo(index);
        },
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_rounded),
            label: '내모임',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: '검색',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_rounded),
            label: '지도',
          ),
        ],
      ),
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        children: [
          HomeListScreen(),
          HomeMyGroupScreen(),
          HomeSearchScreen(),
          HomeMapScreen(),
        ],
      ),
    );
  }
}
