import 'package:flutter/material.dart';

class Wisdom extends StatefulWidget {
  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int _index = 0;

  List quotes = [
    "Der Pantoffel der Gerechtigkeit wird zuschlagen.",
    "Ein Gentleman schweigt und genießt, aber ich hab.... ",
    "Hahahahahahahahahah",
    "Schenkelklopfer",
    "Was ich dazu mal sagen wollte (fängt dann aber mit einem anderen Thema an)",
    "Damals, bei der Bundeswehr...",
    "Frauen können ja eh nichts durchziehen",
    "Auf Jedi!",
    "...",
    ""
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Container(
                    width: 350,
                    height: 200,
                    margin: EdgeInsets.all(30.0),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(14.5),
                    ),
                    child: Center(
                        child: Text(
                      quotes[_index % quotes.length],
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontStyle: FontStyle.italic,
                        fontSize: 16.5,
                      ),
                    ))),
              ),
            ),
            Divider(
              thickness: 1.3,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: FlatButton.icon(
                onPressed: _showQuote,
                color: Colors.green.shade700,
                icon: Icon(Icons.announcement),
                label: Text(
                  "Was würde Matze sagen?",
                  style: TextStyle(
                    fontSize: 18.8,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }

  void _showQuote() {
// increment our index/ Counter by 1
    setState(() {
      _index += 1;
    });
  }
}

class BizCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BizCards"),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      backgroundColor: Colors.redAccent,
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[_getCard(), _getAvatar()],
        ),
      ),
    );
  }

  Container _getCard() {
    return Container(
      width: 400,
      height: 200,
      margin: EdgeInsets.all(50.0),
      decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
          borderRadius: BorderRadius.circular(4.5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Florian Budnik",
            style: TextStyle(
                fontSize: 20.9,
                color: Colors.white,
                fontWeight: FontWeight.w500),
          ),
          Text("Buildappswithpaulo.com"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.person_pin),
              Text("T:@buildappswithme")
            ],
          )
        ],
      ),
    );
  }

  Container _getAvatar() {
    return Container(
      width: 100,
      height: 100,
      margin: EdgeInsets.fromLTRB(00, 100, 290, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          border: Border.all(color: Colors.white, width: 1.2),
          image: DecorationImage(
              image: NetworkImage("https://picsum.photos/300/300"),
              fit: BoxFit.cover)),
    );
  }
}

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen,
        child: Icon(Icons.featured_play_list),
        onPressed: () => debugPrint("Hello"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time), title: Text("First")),
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit), title: Text("Second")),
          BottomNavigationBarItem(
              icon: Icon(Icons.accessibility), title: Text("Third"))
        ],
        onTap: (int index) => debugPrint("Tapped item: $index"),
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
