import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:Online_grocery_app/Helpers/Devicesize.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';

class fv extends StatefulWidget {
  @override
  _fvState createState() => _fvState();
}

class _fvState extends State<fv> {
  TextEditingController SubCategoryname = new TextEditingController();
  TextEditingController SubCategoryprice = new TextEditingController();
  TextEditingController SubCategoryquantity = new TextEditingController();
  String Imgname;
  String Imgloc;
  String Categoryname;
  String dropdownValue = "Please select a category";
  var imgstring;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter the details"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 10.0, right: 10.0),
          child: Container(
            child: Column(
              children: [
                Card(
                  elevation: 7.0,
                  child: Container(
                    height: displayHeight(context) * 0.075,
                    width: displayWidth(context) * 0.95,
                    child: DropdownButton(
                      hint: dropdownValue == null
                          ? Text('Please select a category')
                          : Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                dropdownValue,
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                      isExpanded: true,
                      iconSize: 30.0,
                      style: TextStyle(color: Colors.blue),
                      items: ['Potato', 'Tomato', 'Cauliflower'].map(
                        (val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        setState(
                          () {
                            dropdownValue = val;
                            Categoryname = val;
                          },
                        );
                      },
                    ),
                  ),
                ),
                TextFormField(
                  controller: SubCategoryname,
                  decoration: InputDecoration(
                    hintText: "Subcategoryname",
                  ),
                ),
                SizedBox(
                  height: displayHeight(context) * 0.02,
                ),
                TextFormField(
                  controller: SubCategoryquantity,
                  decoration: InputDecoration(
                    hintText: "SubCategoryquantity",
                  ),
                ),
                SizedBox(
                  height: displayHeight(context) * 0.02,
                ),
                TextFormField(
                  controller: SubCategoryprice,
                  decoration: InputDecoration(
                    hintText: "subcategoryprice",
                  ),
                ),
                SizedBox(
                  height: displayHeight(context) * 0.05,
                ),
                ButtonTheme(
                  height: displayHeight(context) * 0.15,
                  minWidth: displayWidth(context)*0.32,
                  child: OutlineButton(
                    
                    borderSide: BorderSide(color: Colors.grey, width: 2.5),
                    onPressed: getImage,
                    child: Icon(Icons.add,size: 30.0),
                  ),
                  
                ),
                
                 SizedBox(
                  height: displayHeight(context) * 0.05,
                ),
                FlatButton(
                  color: Colors.blue,
                    onPressed: () {
                      Map<String, dynamic> data = {
                        "field1": SubCategoryname.text,
                        "field2": SubCategoryquantity.text,
                        "field3": SubCategoryprice.text,
                        "field4": Imgname,
                        "field5": Imgloc,
                      };

                      //FirebaseFirestore.instance.collection("test").add(data);
                      FirebaseFirestore.instance
                          .collection(Categoryname)
                          .doc(SubCategoryname.text)
                          .set(data);
                      // .collection(Categoryname.text)
                      // .doc()
                      //  .collection("Pulses")
                      //  .doc(SubCategoryname.text)
                      //  .set(data);
                    },
                    child: Text("Submit",style: TextStyle(color: Colors.white),)),
                    
              ],
            ),
          ),
        ),
      ),
    );
  }

  final imagePicker = ImagePicker();

  Future getImage() async {
    var image = await imagePicker.getImage(source: ImageSource.gallery,
    imageQuality: 80);
    File img = File(image.path);
    // print(image.path);
    uploadImageToFirebase(img);
  }

  Future<void> uploadImageToFirebase(File img) async {
    try {
      //Make random name of the image !!
      int randomnumber = Random().nextInt(100000);
      String imageLocation = "images/image${randomnumber}.jpg";
      final StorageReference storageReference =
          FirebaseStorage().ref().child(imageLocation);
      final StorageUploadTask uploadTask = storageReference.putFile(img);
      final StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
      String url = await taskSnapshot.ref.getDownloadURL().whenComplete(() async
      {
      print(imageLocation);
      _addimage(imageLocation);
      });
      
      _addimageurl(url);
    } catch (e) {
      print(e.message);
    }
  }

 

  void _addimage(String imageLocation) {
    Imgname = imageLocation;
  }

  void _addimageurl(String url) {
    Imgloc = url;
  }
}

