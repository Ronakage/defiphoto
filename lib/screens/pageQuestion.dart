import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import '../widget/messageReceivedWidget.dart';

class pageQuestion extends StatefulWidget {
  final String txt;

  pageQuestion({
    this.txt,
  });

  @override
  State<StatefulWidget> createState() => pageQuestionState();
}

class pageQuestionState extends State<pageQuestion> {
  
  File imageFile;
  
  TextEditingController messageSend = new TextEditingController();

  _ouvrirGallery() async{
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState((){
      imageFile = image;
    });
  }

  _ouvrirCamera() async{
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState((){
      imageFile = image;
    });
  }

  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Poser une question',
                ),
                Opacity(
                  opacity: 0.65,
                )
              ]),
        ),
        body: Stack(children: <Widget>[
          Positioned.fill(
              child: Column(children: <Widget>[
            Expanded(child: Text('')
            ),
            Container(
                margin: EdgeInsets.all(15.0),
                height: 61,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(35.0),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 3),
                                blurRadius: 5,
                                color: Colors.black)
                          ],
                        ),
                        child: Row(
                          children: <Widget>[
                            IconButton(
                                icon: Icon(Icons.send,color:Colors.black), onPressed: () {}),
                            Expanded(
                              child: TextField(
                                style: new TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                    hintText: "Question",
                                     hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
                                    border: InputBorder.none),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.photo_camera,color:Colors.black),
                              onPressed: () {_ouvrirCamera();},
                            ),
                            IconButton(
                              icon: Icon(Icons.photo,color:Colors.black),
                              onPressed: () {_ouvrirGallery();},
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          color: Colors.cyan, shape: BoxShape.circle),
                      child: InkWell(
                        child: Icon(
                          Icons.keyboard_voice,
                          color: Colors.black,
                        ),
                        onLongPress: () {
                          setState(() {});
                        },
                      ),
                    )
                  ],
                )),
          ]))
        ]));
  }
}
