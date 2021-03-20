import 'package:Online_grocery_app/Admin/Fruits/Freshvegetables.dart';
import 'package:flutter/material.dart';
import 'package:Online_grocery_app/Helpers/Devicesize.dart';

class  foodgrains extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Subcategory"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 30),
        child: ListView(
          children: <Widget>[
            ListTile(
            //  leading: Icon(Icons.add_circle_outline),
              title: Text("Atta,Flours & Sooji"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => fv()));
              },
            ),
            Divider(),
            ListTile(
              //leading: Icon(Icons.library_books_rounded),
              title: Text("Dals & Pulses"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {},
            ),
            Divider(),
            ListTile(
             // leading: Icon(Icons.add_circle),
              title: Text("Rice & Rice Products"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {},
            ),
            Divider(),
            ListTile(
             // leading: Icon(Icons.category),
              title: Text("Organic Stapkes"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              //leading: Icon(Icons.category),
              title: Text("Salt, Sugar & Jaggery"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {},
            ),
            Divider(),
            ListTile(
             // leading: Icon(Icons.category),
              title: Text("Edible Oils & Ghee"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {},
            ),
            Divider(),
            ListTile(
             // leading: Icon(Icons.category),
              title: Text("Masala & Spices"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {},
            ),
            Divider(),
            ListTile(
             // leading: Icon(Icons.category),
              title: Text("Dry Fruits"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
