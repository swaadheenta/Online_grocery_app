import 'package:Online_grocery_app/List.dart';
import 'package:Online_grocery_app/Category/category.dart';
import 'package:Online_grocery_app/Helpers/Devicesize.dart';
import 'package:Online_grocery_app/Profile.dart';
import 'package:Online_grocery_app/uhome.dart';
import 'package:flutter/material.dart';
import 'Cart.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedindex = 0;

  List<Widget> pagelist = <Widget>[
    ushome(),
    Category(),
    Shoppinglist(),
    Cart(),
   profile(),
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
                    color: _selectedindex == 0 ? Color(0xffb192734) : Colors.grey),
               

                backgroundColor: Colors.white,
                title: Text(
                  "Home",
                  style: TextStyle(
                      color: _selectedindex == 0 ? Color(0xffb192734) : Colors.grey),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.category,
                    color: _selectedindex == 1 ? Color(0xffb192734) : Colors.grey),
             
                title: Text(
                  "Categories",
                  style: TextStyle(
                      color: _selectedindex == 1 ? Color(0xffb192734) : Colors.grey),
                ),
                backgroundColor: Colors.white),
           BottomNavigationBarItem(
                icon: Icon(Icons.list_alt,
                    color: _selectedindex == 2 ? Color(0xffb192734) : Colors.grey),
              
                title: Text(
                  "List",
                  style: TextStyle(
                      color: _selectedindex == 2 ? Color(0xffb192734) : Colors.grey),
                ),
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket,
                    color: _selectedindex == 3 ? Color(0xffb192734) : Colors.grey),
                
                title: Text(
                  "Cart",
                  style: TextStyle(
                      color: _selectedindex == 3 ? Color(0xffb192734) : Colors.grey),
                ),
                backgroundColor: Colors.white),
                  BottomNavigationBarItem(
                icon: Icon(Icons.account_circle,
                    color: _selectedindex == 4 ? Color(0xffb192734) : Colors.grey),
              
                title: Text(
                  "Profile",
                  style: TextStyle(
                      color: _selectedindex == 4 ? Color(0xffb192734) : Colors.grey),
                ),
                backgroundColor: Colors.white)
          ],
          currentIndex: _selectedindex,
          onTap: ontap,
        ),
      ),
    );
  }
}
