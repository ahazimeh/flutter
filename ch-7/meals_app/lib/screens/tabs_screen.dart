import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // final List<Map<String, dynamic>> _pages = [
  final List<Map<String, Object>> _pages = [
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': FavoritesScreen(),
      'title': 'Your Favorite',
    },
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  // Widget build(BuildContext context) {
  //   return DefaultTabController(
  //       length: 2,
  //       initialIndex: 0,
  //       child: Scaffold(
  //         appBar: AppBar(
  //           title: Text('Meals'),
  //           bottom: TabBar(tabs: [
  //             Tab(
  //               icon: Icon(Icons.category),
  //               text: 'Categories',
  //             ),
  //             Tab(
  //               icon: Icon(Icons.star),
  //               text: 'Favorites',
  //             ),
  //           ]),
  //         ),
  //         body: TabBarView(
  //           children: [CategoriesScreen(), FavoritesScreen()],
  //         ),
  //       ));
  // }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'] as String),
      ),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,

        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.shifting,
        // selectedFontSize: ,
        // unselectedFontSize: ,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context)
                .colorScheme
                .primary, // this is needed because we specified the type to shifting
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context)
                .colorScheme
                .primary, // this is needed because we specified the type to shifting
            icon: Icon(Icons.star),
            label: 'Favorites',
          )
        ],
      ),
    );
  }
}
