import 'package:flutter/material.dart';
import 'package:netflix/screens/home_page.dart';
import 'package:netflix/screens/search_screen.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView>
    with TickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: [
          HomeScreen(),
          SearchScreen(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        elevation: 0.0,
        child: TabBar(
          dividerColor: Colors.black,
          controller: controller,
          labelColor: Colors.red,
          indicatorColor: Colors.red,
          unselectedLabelColor: Colors.white54,
          tabs: const [
            Tab(
              icon: Icon(Icons.home),
              text: "Home",
            ),
            Tab(
              icon: Icon(Icons.search),
              text: "Search",
            )
          ],
        ),
      ),
    );
  }
}
