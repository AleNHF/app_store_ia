import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:app_store_ia/pages/product_page.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 13.0),
          child: Row(
            children: [
              Container(
                width: 35.0,
                height: 35.0,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: const Center(child: Text("K")),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(246, 246, 246, 1),
                      //color : Colors.red,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search ...",
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              const Icon(
                Icons.menu,
                color: Colors.black,
                size: 30.0,
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            child: Text(
              "Our Product",
              style: TextStyle(fontSize: 25.0),
            ),
          ),
          SizedBox(
            height: 30.0,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15.0),
                  width: 100,
                  height: 10,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(18.0)),
                  child: const Center(
                      child: Text(
                    "Popular",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15.0),
                  width: 100,
                  height: 10,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(18.0)),
                  child: const Center(
                      child: Text(
                    "Mens",
                    style: TextStyle(color: Colors.black),
                  )),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15.0),
                  width: 100,
                  height: 10,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(18.0)),
                  child: const Center(
                      child: Text(
                    "Womens",
                    style: TextStyle(color: Colors.black),
                  )),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15.0),
                  width: 100,
                  height: 10,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(18.0)),
                  child: const Center(
                      child: Text(
                    "Mens",
                    style: TextStyle(color: Colors.black),
                  )),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15.0),
                  width: 100,
                  height: 10,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(18.0)),
                  child: const Center(
                      child: Text(
                    "Womens",
                    style: TextStyle(color: Colors.black),
                  )),
                ),
              ],
            ),
          ),
          GridView.count(
            padding: const EdgeInsets.only(top: 15.0),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 1,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const ProductPage();
                        }));
                      },
                      child: SizedBox(
                          height: 160.0,
                          width: 140.0,
                          child: Image.asset(
                            "assets/images/2.jpg",
                            height: 100,
                            fit: BoxFit.cover,
                          )),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Swearter TURU",
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 3.0),
                      child: Text(
                        "\$ 52.22",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: 160.0,
                        width: 140.0,
                        child: Image.asset(
                          "assets/images/3.jpg",
                          height: 100,
                          fit: BoxFit.cover,
                        )),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Swearter TURU",
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 3.0),
                      child: Text(
                        "\$ 52.22",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: 160.0,
                        width: 140.0,
                        child: Image.asset(
                          "assets/images/2.jpg",
                          height: 100,
                          fit: BoxFit.cover,
                        )),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Swearter TURU",
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 3.0),
                      child: Text(
                        "\$ 52.22",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: 160.0,
                        width: 140.0,
                        child: Image.asset(
                          "assets/images/3.jpg",
                          height: 100,
                          fit: BoxFit.cover,
                        )),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Swearter TURU",
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 3.0),
                      child: Text(
                        "\$ 52.22",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black,
        child: badges.Badge(
            badgeContent: const Text(
              '3',
              style: TextStyle(color: Colors.white),
            ),
            //alignment: Alignment.topRight,
            position: badges.BadgePosition.topStart(start: 25, top: -20),
            //borderSide: BorderSide(color: Colors.white),
            //padding: EdgeInsets.all(7.0),
            child: const Icon(Icons.shopping_cart_outlined)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        activeColor: Colors.black,
        inactiveColor: Colors.grey,
        icons: const [
          Icons.home,
          Icons.explore,
          Icons.notifications_active,
          Icons.account_circle_outlined
        ],
        activeIndex: 0,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.smoothEdge,
        onTap: (index) => {},
        //other params
      ),
    );
  }
}
