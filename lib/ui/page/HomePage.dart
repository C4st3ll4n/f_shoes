import 'package:flutter/material.dart';
import 'package:fshoes/mock/ShoesMock.dart';
import 'package:fshoes/ui/widget/ShoeItem.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;

  int _currentIndex;
  int _currentIndexMore;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: ShoesMock.shoesMarks.length,
      vsync: this,
    );

    _pageController = PageController(initialPage: 0, viewportFraction: 0.6);

    _currentIndex = 0;
    _currentIndexMore = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Lançamentos",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 320,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: ShoesMock.shoesList.length,
                physics: BouncingScrollPhysics(),
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  return ShoeItem(
                      shoe: ShoesMock.shoesList[index],
                      currentIndex: _currentIndex,
                      index: index);
                },
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        bottom: TabBar(
          isScrollable: true,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.white,
          labelStyle: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Google'),
          controller: _tabController,
          tabs: _buildTabBarView(),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Descubra",
          style: TextStyle(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: <Widget>[
          Container(
            decoration:
                BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
            height: 40,
            width: 40,
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200], shape: BoxShape.circle),
              height: 40,
              width: 40,
              child: Icon(
                Icons.notifications_none,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black87,
          unselectedItemColor: Colors.black26,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text("Home")),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), title: Text("Favorites")),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text("Profile"))
          ]),
    );
  }

  _buildTabBarView() {
    List<Widget> list = [];
    ShoesMock.shoesMarks.forEach((f) => list.add(Text(f)));
    return list;
  }
}
