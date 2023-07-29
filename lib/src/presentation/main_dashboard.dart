import 'package:flutter/material.dart';
import 'package:food_delivery/src/presentation/home_view/home_screen.dart';
import 'package:food_delivery/src/widgets/bottom_navigation_bar/navigation_bar_item_model.dart';
import 'package:food_delivery/src/widgets/bottom_navigation_bar/NavBars.dart';

enum _SelectedTab { home, favorite, search, person }

class MainDashboard extends StatefulWidget {
  const MainDashboard({
    super.key,
  });

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> with TickerProviderStateMixin {
  final PageController _pageController = PageController(initialPage: 0);
  _SelectedTab _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
      _pageController.jumpToPage(i);
    });
  }

  final List<Widget> bottomBarPages = <Widget>[
    const HomeScreen(),
    const Page2(),
    const Page3(),
    const Page4(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List<Widget>.generate(
            bottomBarPages.length, (int index) => bottomBarPages[index]),
      ),
      bottomNavigationBar: DotNavigationBar(
        margin: const EdgeInsets.only(left: 5, right: 5),
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        dotIndicatorColor: Colors.white,
        unselectedItemColor: Colors.grey[300],
        splashBorderRadius: 50,
        // enableFloatingNavBar: false,
        onTap: _handleIndexChanged,
        items: <NavigationBarItemModel>[
          NavigationBarItemModel(
            icon: const Icon(Icons.home),
            selectedColor: Colors.yellow,
          ),
          NavigationBarItemModel(
            icon: const Icon(Icons.person),
            selectedColor: Colors.yellow,
          ),
          NavigationBarItemModel(
            icon: const Icon(Icons.favorite),
            selectedColor: Colors.yellow,
          ),
          NavigationBarItemModel(
            icon: const Icon(Icons.shopping_bag),
            selectedColor: Colors.yellow,
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green, child: const Center(child: Text('Page 2')));
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red, child: const Center(child: Text('Page 3')));
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue, child: const Center(child: Text('Page 4')));
  }
}