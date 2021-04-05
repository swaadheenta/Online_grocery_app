import 'package:Online_grocery_app/Category/category.dart';
import 'package:Online_grocery_app/Helpers/Devicesize.dart';
import 'package:Online_grocery_app/uhome.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedindex = 0;

  List<Widget> pagelist = <Widget>[
    ushome(),
    Category(),
    Text("Search"),
    Text("Cart"),
  ];

  void ontap(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: pagelist.elementAt(_selectedindex)),
      bottomNavigationBar: SizedBox(
        height: displayHeight(context) * 0.08,
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home,
              color: _selectedindex==0?Colors.blue:Colors.grey
              ),
             // label: "Home",
              
              backgroundColor: Colors.white,
              title: Text("Home",
              style: TextStyle(
                color: _selectedindex==0?Colors.blue:Colors.grey
              ),)
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.category,color: _selectedindex==1?Colors.blue:Colors.grey), 
                //label: "Categories",
                title: Text("Categories",
              style: TextStyle(
                color: _selectedindex==1?Colors.blue:Colors.grey
              ),)
               , backgroundColor: Colors.white
               ),
            BottomNavigationBarItem(icon: Icon(Icons.search,color: _selectedindex==2?Colors.blue:Colors.grey), 
            //label: "Search",
            title: Text("Search",
              style: TextStyle(
                color: _selectedindex==2?Colors.blue:Colors.grey
              ),),
            backgroundColor: Colors.white
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket,
               color: _selectedindex==3?Colors.blue:Colors.grey), 
                //label: "cart",
                title: Text("Cart",
              style: TextStyle(
                color: _selectedindex==3?Colors.blue:Colors.grey
              ),),
                backgroundColor: Colors.white
                ),
          ],
          currentIndex: _selectedindex,
          onTap: ontap,
        ),
      ),
    );
  }
}
