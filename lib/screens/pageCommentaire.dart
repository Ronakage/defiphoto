import 'package:flutter/material.dart';
import 'messageReceivedWidget.dart';

class pageCommentaire extends StatefulWidget {
  final String txt;

  pageCommentaire({
    this.txt,
  });

  @override
  State<StatefulWidget> createState() => pageCommentaireState();
}

class pageCommentaireState extends State<pageCommentaire> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Répondre à la question',
                ),
                Opacity(
                  opacity: 0.65,
                )
              ]),
        ),
        body: Stack(children: <Widget>[
          Positioned.fill(
              child: Column(children: <Widget>[
            Expanded(child: ListView.builder(
                    padding: const EdgeInsets.all(15),
                    itemCount: 1,
                    itemBuilder: (ctx, i) {
                     return ReceivedMessagesWidget(txt: widget.txt);
                    },
                  ),
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
                                    hintText: "Répondre",
                                     hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
                                    border: InputBorder.none),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.photo_camera,color:Colors.black),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(Icons.photo,color:Colors.black),
                              onPressed: () {},
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
