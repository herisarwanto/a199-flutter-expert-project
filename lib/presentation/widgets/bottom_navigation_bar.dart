import 'package:ditonton/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/home_movie_page.dart';
import '../pages/search_page.dart';
import '../pages/watchlist_movies_page.dart';
import '../provider/botnav_bar_notifier.dart';

class BottomNavigationBarWidget extends StatelessWidget {

  var currentTab = [
    HomeMoviePage(),
    SearchPage(),
    WatchlistMoviesPage(),
    WatchlistMoviesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarNotifier>(context);

    return Scaffold(
      body: currentTab[provider.currentIndex],
      bottomNavigationBar: Container(
        // decoration: BoxDecoration(
        //   boxShadow: [
        //     BoxShadow(
        //       color: Colors.white,
        //       blurRadius: 0.5,
        //     ),
        //   ]
        // ),
        child: BottomNavigationBar(
          elevation: 2,
          // backgroundColor: kRichBlack,
          currentIndex: provider.currentIndex,
          selectedItemColor: kMikadoYellow,
          unselectedItemColor: Colors.white,
          onTap: (index) {
            provider.currentIndex = index;
          },
          items: [
            BottomNavigationBarItem(
                icon: new Icon(Icons.home),
                label: "Home"
            ),
            BottomNavigationBarItem(
                icon: new Icon(Icons.search),
                label: "Search"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.movie_creation_outlined),
                label: "Watchlist"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: "Watchlist"
            )
          ],
        ),
      ),
    );
  }
}
