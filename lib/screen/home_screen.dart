import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recepie_application/screen/details_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final imagesLocation = [
    "assets/images01.jpg",
    "assets/images02.jpg",
    "assets/images03.jpg",
    "assets/images04.jpg",
    "assets/pizza03.jpg",
    "assets/pizza04.jpg",

  ];
  final imageTitle = [
    "Potato Pasta",
    "Delicious Pasta",
    "Tasty Pizza",
    "Mutton Pasta",
    "Noduls with Mutton",
    "Bangldeshi Pizza",

  ];


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "Looking for yor favourite meal",
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        IconButton(icon: Icon(Icons.search), onPressed: null),
                        IconButton(
                            icon: Icon(Icons.notifications), onPressed: null),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: size.height * 0.25,
                    child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return AspectRatio(
                            aspectRatio: 0.9 / 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    child: ClipRRect(
                                      child: Image.asset(
                                        imagesLocation[index],
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  child: Text(
                                    imageTitle[index],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.0),
                                  ),
                                  padding: EdgeInsets.only(top: 10),
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, _) => SizedBox(
                              width: 16,
                            ),
                        itemCount: imagesLocation.length),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: size.height * 0.40,
                    child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return DetailsScreen( imagesLocation[index]);
                              }));
                            },
                            child: AspectRatio(
                              aspectRatio: 1 / 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Hero(
                                      child: Container(
                                        child: ClipRRect(
                                          child: Image.asset(
                                            imagesLocation[index],
                                            fit: BoxFit.scaleDown,
                                          ),
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                      ),
                                      tag: imagesLocation[index],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    child: Text(
                                      imageTitle[index],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18.0),
                                    ),
                                    padding: EdgeInsets.only(top: 15),
                                  ),
                                  Padding(
                                    child: Text(
                                      "Recipe by Bangla.com",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.0),
                                    ),
                                    padding: EdgeInsets.only(top: 8),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, _) => SizedBox(
                              width: 16,
                            ),
                        itemCount: imagesLocation.length),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text("Home")),
            BottomNavigationBarItem(
                icon: Icon(Icons.fastfood), title: Text("Recipe")),
            BottomNavigationBarItem(
                icon: Icon(Icons.subscriptions), title: Text("Subscription")),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), title: Text("Setting")),
          ],
          iconSize: 30.0,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.green,
          selectedItemColor: Colors.white70,
        ));
  }
}
