import 'package:flutter/material.dart';
import 'movie_popular_view.dart';
import 'movie_top_rated_view.dart';
import 'info_view.dart';



class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
 State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  int _selectedIndex = 0;

 final List<Widget> _views = [
    const MoviePopularView(),
    const MovieTopRatedView(),
    const InfoView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: IndexedStack(index: _selectedIndex, children: _views),
      bottomNavigationBar: BottomNavigationBar(

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Popular'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Top Rated'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Info'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.yellow,
      ),
    );
  }

}
