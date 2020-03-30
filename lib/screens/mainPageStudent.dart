import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_flutter/screens/main.dart';
import 'customDrawer.dart';
import 'pageQuestion.dart';
import '../data/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Widget appBarTitle =
    Text('Matières et produits', style: TextStyle(fontSize: 15));

class MainPage extends StatefulWidget {
  mainPage createState() => new mainPage();
}

class mainPage extends State<MainPage> {

  List questions = [{}];
  Map userData = {};
  int _currentIndex=0;
  String type;
 


  getData() async {
  
     String id = userData["givenId"];
     var response = await http.get("https://defiphoto-api.herokuapp.com/questions/$id");
     if (response.statusCode == 200){
       setState(() {
         questions =  json.decode(response.body);
       });     
     }
 }


  getBody(int currentIndex){
     String section;
     var questionSection;
     List questionSectionTab = new List();
     getData();
    setState(() {
    switch(currentIndex){
      case 0 :
        section = "M";
        appBarTitle =
            Text('Matières et produits', style: TextStyle(fontSize: 15));
        break;
       case 1:
        section = "É";
        appBarTitle =
            Text('Équipement', style: TextStyle(fontSize: 15));
        break;
         case 2 :
        section = "T";
        appBarTitle =
            Text('Tâches', style: TextStyle(fontSize: 15));
        break;
         case 3 :
        section = "I";
        appBarTitle =
            Text('Individu', style: TextStyle(fontSize: 15));
        break;
         case 4 :
        section = "E";
        appBarTitle =
            Text('Environnement', style: TextStyle(fontSize: 15));
        break;
         case 5 :
        section = "R";
        appBarTitle =
            Text('Ressources humaines', style: TextStyle(fontSize: 15));
        break;
    }
    print(section);

    
    
    for(var i=0; i < questions.length ; i++){
      questionSection = {
          "id":questions[i]["_id"],
          "sender":questions[i]["sender"],
          "text":questions[i]["text"]
        };
      if(questions[i]["type"]==section && questions[i]!= null){
        questionSectionTab.add(questionSection);     
      }
    }

    });
    
    return Container(child:
    ListView.builder(
    itemCount: questionSectionTab.length,
    itemBuilder:  (context ,index){
      return Card(
              color:Colors.grey[850],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                  side: BorderSide(width: 0.5, color: Colors.grey)),
              child: ListTile(
                leading: Icon(Icons.question_answer ,size: 40),
                title: Text(questionSectionTab[index]["text"] ??'',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(questionSectionTab[index]["sender"]??""),
                contentPadding: EdgeInsets.all(10),
                onTap: () {
                
                 Navigator.pushReplacementNamed(context,'/pageCommentaire',arguments: {
                       'questionId': questionSectionTab[index]["id"],
                  });
                },
              ),
            );
        }
    ));


  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
     Future.delayed(Duration(milliseconds: 100)).then((_) {
       setState(() {
           userData = ModalRoute.of(context).settings.arguments;
          getData();
          
       });
   
    });
  
  }

  
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: Container(color:Colors.grey[900],child:customDrawer(userData: userData,)),
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
          title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Défi photo",
                ),
                Opacity(
                  opacity: 0.65,
                  child: appBarTitle,
                )
              ]),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {})
          ]),
      body: getBody(_currentIndex) ,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.grey[900],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text("M")
          ),
          BottomNavigationBarItem(
               icon: Icon(Icons.scanner),
            title: Text("É")
          ),
          BottomNavigationBarItem(
               icon: Icon(Icons.group_work),
            title: Text("T")
          ),
          BottomNavigationBarItem(
               icon: Icon(Icons.people),
            title: Text("I")
          ),
          BottomNavigationBarItem(
               icon: Icon(Icons.work),
            title: Text("E")
          ),
          BottomNavigationBarItem(
               icon: Icon(Icons.people),
            title: Text("R")
          ),
        ],
           onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
        },
        ),
      
    );
  
  }
  
}