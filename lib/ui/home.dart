import 'package:flutter/material.dart';

class ScaffoldExample extends StatelessWidget {
  _tapButton() {
    debugPrint("Tapped buttomn");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Heef-tig"),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.email),
              onPressed: () => debugPrint("Email wurde gedrückt")),
          IconButton(
              icon: Icon(Icons.battery_charging_full), onPressed: _tapButton)
        ],
      ),
      backgroundColor: Colors.indigo.shade600,
      body: Container(
          alignment: Alignment.center,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CustomButtons()

//            InkWell(
//              child: Text("Drück mich!",
//              style: TextStyle(fontSize: 23.4),),
//             focusColor: Colors.black,
//             splashColor: Colors.yellowAccent,
//             radius: 240,
//             autofocus: true,
//             enableFeedback: true,
//             onTap: () => debugPrint("gedrückt..."),
              ])),
    );
  }
}

class CustomButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(
          content: Text("Hello there!"),
          backgroundColor: Colors.pinkAccent,
        );

        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.pinkAccent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text("Button"),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.deepOrange,
        child: Center(
            child: Text(
          "Hello Flutter",
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 23.4,
            fontStyle: FontStyle.italic,
          ),
        )));

//    return Center(
//      child: Text("Hello Flutter" "Das ist ein Test",
//        textDirection: TextDirection.ltr,),
//
//    );
  }
}
