import 'package:first_flutter_app/model/movie.dart';
import 'package:first_flutter_app/model/question.dart';
import 'package:first_flutter_app/util/hexcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'movie_ui/movie_ui.dart';

class MovieListView extends StatelessWidget {
  final List<Movie> movieList = Movie.getMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(children: <Widget>[
              movieCard(movieList[index], context),
              Positioned(top: 10.0, child: movieImage(movieList[index].poster)),
            ]);
          }),
    );
  }

  TextStyle mainTextStyle() {
    return TextStyle(
      fontSize: 15.0,
      color: Colors.white60,
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 60.0),
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
          color: Colors.red.shade400,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 54.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          movie.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text("Rating: ${movie.imdbRating}/10",
                          style: mainTextStyle()),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text("Released: ${movie.released}",
                          style: mainTextStyle()),
                      Text("${movie.runtime}", style: mainTextStyle()),
                      Text(
                        "${movie.rated}",
                        style: mainTextStyle(),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    MovieListViewDetails(movieName: movie.title, movie: movie)))
      },
    );
  }

  Widget movieImage(String imageUrl) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            image: NetworkImage(imageUrl ??
                'https://m.media-amazon.com/images/M/MV5BMjNkMzc2N2QtNjVlNS00ZTk5LTg0MTgtODY2MDAwNTMwZjBjXkEyXkFqcGdeQXVyNDk3NzU2MTQ@._V1_UX182_CR0,0,182,268_AL_.jpg'),
            fit: BoxFit.cover),
      ),
    );
  }
}

//New route (screen or page)
class MovieListViewDetails extends StatelessWidget {
  final String movieName;
  final Movie movie;

  const MovieListViewDetails({Key key, this.movieName, this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${movie.title}".toUpperCase()),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: ListView(
        children: <Widget>[
          MovieDetailsThumbnail(
            thumbnail: movie.images[0],
          ),
          MovieDetailsHeaderWithPoster(movie: movie),
          HorizontalLine(),
          MovieDetailsCast(movie: movie),
          HorizontalLine(),
          MovieDetailsExtraPoster(
            posters: movie.images,
          ),
        ],
      ),
//      Container(
//        child: Center(
//          child: RaisedButton(
//              child: Text("Go back ${this.movie.director}"),
//              onPressed: ()    {
//                Navigator.pop(context, MaterialPageRoute(
//                    builder: (context) => MovieListView()));
//
//              }
//          ),
//        ),
      // ),
    );
  }
}

class QuizzApp extends StatefulWidget {
  @override
  _QuizzAppState createState() => _QuizzAppState();
}

class _QuizzAppState extends State<QuizzApp> {
  int _currentQuestionIndex = 0;

  List questionBank = [
    Question.name("General Grievous Schiff ist die Daedalus", false),
    Question.name("Luke Skywalker ist der Sohn von Anakin Skywalker.", true),
    Question.name(
        "Lando Calrissian ist der Held der Schlacht von Kaanap.", false),
    Question.name("Han Solo hat zuerst geschossen.", true),
    Question.name("Ein X-Wing ist schneller als ein A-Wing.", false),
    Question.name("Die Klone sind alle gleich", false),
    Question.name("Es gab nur 3 Millionen Klone", true),
    Question.name("Es waren Klone auf dem Todesstern und auf Hoth", true),
    Question.name("Die Erste Ordnung hat noch Klone", false),
    Question.name("Boba Fett war ein Mandalorianer", false),
    Question.name(
        "Cody war ein:"
        "\n Klon-Marschall"
        "\n Freund Obi-Wans",
        true),
    Question.name("Wie ist Fives( aus der 501.st) gestorben?", true),
    Question.name("Mace Windus Lichtschwert is Lila", true),
    Question.name("Dart Maul stribt auf Naboo", false),
    Question.name(
        "Die Resolute ist das Flaggschiff von General Skywalker?", true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Was weiß Obi-Wan?"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey,
      //we use  [Builder] hereto use a [context] that is a descendent of [Scaffold]
      //or else [Scaffold.of] will return non
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image.asset(
                  "images/Republic_Emblem.png",
                  width: 250,
                  height: 180,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(14.4),
                    border: Border.all(
                      color: Colors.blueGrey.shade400,
                      style: BorderStyle.solid,
                    ),
                  ),
                  height: 120.0,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      questionBank[_currentQuestionIndex].questionText,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => _prevQuestion(),
                    color: Colors.blueGrey.shade900,
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      SnackBar(
                        content: Text("${_checkAnswer(true, context)}"),
                      );
                    },
                    color: Colors.blueGrey.shade900,
                    child: Text(
                      "Stimmt!",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAnswer(false, context),
                    color: Colors.blueGrey.shade900,
                    child:
                        Text("Falsch", style: TextStyle(color: Colors.white)),
                  ),
                  RaisedButton(
                    onPressed: () => _nextQuestion(),
                    color: Colors.blueGrey.shade900,
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  _checkAnswer(bool userChoice, BuildContext context) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      final snackbar = SnackBar(
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          backgroundColor: Colors.green.shade900,
          elevation: 12,
          duration: Duration(milliseconds: 500),
          content: Text("Richtig!"));
      Scaffold.of(context).showSnackBar(snackbar);
      //correct Answer

      debugPrint("Richtig!");
      _updateQuestion();
    } else {
      final snackbar = SnackBar(
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          backgroundColor: Colors.redAccent,
          duration: Duration(milliseconds: 500),
          content: Text("Das ist nicht richtig!"));
      Scaffold.of(context).showSnackBar(snackbar);
      _updateQuestion();
    }
  }

  _updateQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }

  _nextQuestion() {
    _updateQuestion();
  }

  _prevQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
      debugPrint("Index: $_currentQuestionIndex");
    });
  }
}

class BillSplitter extends StatefulWidget {
  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int _tipPercentag = 10;
  int _personCounter = 1;
  double _billAmount = 0.0;
  double _eggsHeight = 0;
  double _frameHeight = 80;
  double _bikeFactor = 1;
  double _weight = 80.0;
  double _height = 170.0;
  double _percent = 20.0;
  double _fullAmount = 100.0;
  double _partAmount = 20.0;

  Color _purple = HexColor("#6908D6");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculon!"),
        backgroundColor: _purple.withOpacity(0.4),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.0),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: _purple.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Pro Person",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15.0,
                        color: _purple,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "${calculateTotalPerPerson(_billAmount, _personCounter, _tipPercentag)} €",
                        style: TextStyle(
                          fontSize: 34.5,
                          fontWeight: FontWeight.bold,
                          color: _purple,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ), //Rahmenhöhe
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.blueGrey.shade100,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(12.0)),
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType:
                    TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: _purple),
                    decoration: InputDecoration(
                      prefixText: "Rechungssumme ",
                      prefixIcon: Icon(Icons.euro_symbol),
                    ),
                    onChanged: (String value) {
                      try {
                        _billAmount = double.parse(value);
                      } catch (exception) {
                        _billAmount = 0.0;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Personen",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (_personCounter > 1) {
                                  _personCounter--;
                                } else {
                                  //do nothing
                                }
                              });
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: _purple.withOpacity(0.1)),
                              child: Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                      color: _purple,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "$_personCounter",
                            style: TextStyle(
                                color: _purple,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _personCounter++;
                              });
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  color: _purple.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(7.0)),
                              child: Center(
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                    color: _purple,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  //Tip
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Trinkgeld",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          "${calculateTotalTip(_billAmount, _personCounter, _tipPercentag).toStringAsFixed(2)} €",
                          style: TextStyle(
                            color: _purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //Slider
                  Column(
                    children: <Widget>[
                      Text(
                        "$_tipPercentag%",
                        style: TextStyle(
                          color: _purple,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Slider(
                          min: 0.0,
                          max: 100,
                          label: "$_tipPercentag%",
                          activeColor: _purple,
                          inactiveColor: Colors.grey,
                          divisions: 20,
                          //optinal
                          value: _tipPercentag.toDouble(),
                          onChanged: (double newValue) {
                            setState(() {
                              _tipPercentag = newValue.round();
                            });
                          })
                    ],
                  )
                ],
              ),
            ),
            Divider(
              color: _purple.withOpacity(0.5),
              height: 10,
              indent: 25,
              endIndent: 25,
              thickness: 3,
            ),
            Container( //Rahmenhöhe Start
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(12.0),
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: _purple.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Deine ideale Rahmenhöhe ist:", style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15.0,
                    color: _purple,
                  ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "${calculateEggsHeigh(_eggsHeight, _bikeFactor)} cm",
                      style: TextStyle(
                        fontSize: 34.5,
                        fontWeight: FontWeight.bold,
                        color: _purple,
                      ),
                    ),
                  ),

                ],

              ),
            ), //Rahmenhöhe

            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.blueGrey.shade100,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(12.0)),
              child: Column(

                children: <Widget>[

                  TextField(
                    keyboardType: TextInputType.numberWithOptions(
                        decimal: true),
                    style: TextStyle(color: _purple),
                    decoration: InputDecoration(
                      prefixText: "Schrittlänge ",
                      prefixIcon: Icon(Icons.directions_bike),
                    ),
                    onChanged: (String value) {
                      try {
                        _eggsHeight = double.parse(value);
                      } catch (exception) {
                        _eggsHeight = 0.0;
                      }
                    },


                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[

                      InkWell(
                        onTap: () {
                          setState(() {
                            _bikeFactor = 0.66;
                          });
                        },
                        child: Container(
                          width: 60.0,
                          height: 40.0,
                          margin: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.0),
                              color: _purple.withOpacity(0.1)),
                          child: Center(
                            child: Text(
                              "Mountain-Bike",
                              style: TextStyle(
                                  color: _purple,

                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0),
                            ),
                          ),
                        ),

                      ),
                      InkWell(
                        splashColor: Colors.yellowAccent,
                        highlightColor: Colors.blue,

                        onTap: () {
                          setState(() {
                            _bikeFactor = 0.61;
                          });
                        },
                        child: Container(
                          width: 60.0,
                          height: 40.0,
                          margin: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.0),
                            color: _purple.withOpacity(0.1),


                          ),
                          child: Center(
                            child: Text(
                              "Touring-Bike",
                              style: TextStyle(
                                  color: _purple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0),
                            ),
                          ),
                        ),

                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _bikeFactor = 0.665;
                          }

                          );
                        },
                        child: Container(
                          width: 60.0,
                          height: 40.0,
                          margin: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.0),
                              color: _purple.withOpacity(0.1)),
                          child: Center(
                            child: Text(
                              "Rennrad",
                              style: TextStyle(
                                  color: _purple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0),
                            ),
                          ),
                        ),

                      )


                    ],

                  )

                ],
              ),
            ),
            Divider(
              color: _purple,
              height: 10,
              thickness: 3,
              indent: 25,
              endIndent: 25,

            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(12),
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: _purple.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Dein BMI ist",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: _purple,


                    ),),
                  Padding(padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "${calculateBMI(_weight, _height)}", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 34.5,
                      color: _purple,
                    ),),


                  ),

                ],
              ),
            ), //BMI Start
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.blueGrey.shade100,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(12),

              ),
              child: Column(
                children: <Widget>[
                  Text("Gewicht:", style:
                  TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: _purple,
                  ),),
                  Slider(
                    min: 50.0,
                    max: 150.0,
                    divisions: 100,
                    label: "Gewicht: $_weight Kg",
                    activeColor: _purple,
                    inactiveColor: Colors.grey,
                    value: _weight.toDouble(),
                    onChanged: (double newValue) {
                      setState(() {
                        _weight = newValue;
                      });
                    },
                  ),

                  Column(
                    children: <Widget>[
                      Text("Größe", style:
                      TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: _purple,
                      ),),
                      Slider(
                        min: 160,
                        max: 200,
                        divisions: 40,
                        label: "Größe: $_height cm",
                        activeColor: _purple,
                        inactiveColor: Colors.grey,
                        value: _height.toDouble(),
                        onChanged: (double newValue) {
                          setState(() {
                            _height = newValue;
                          });
                        },
                      ),

                    ],
                  )

                ],

              ),


            ),
            Divider(
              color: _purple,
              height: 10,
              thickness: 3,
              indent: 25,
              endIndent: 25,

            ),
            Container( //Prozentstart
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(12),
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: _purple.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Prozentrechner",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: _purple,


                    ),),
                  Padding(padding: const EdgeInsets.all(12.0),
                    child: Text(" ${calculateMasterPercentage(
                        _percent, _partAmount, _fullAmount)}.",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: _purple,
                      ),),

                  ),
//                  Padding(padding: const EdgeInsets.all(12.0),
//                    child: Text("$_percent% sind $_partAmount von ${calculateFullAmount(_percent, _partAmount)}.", style: TextStyle(
//                      fontWeight: FontWeight.bold,
//                      fontSize: 10,
//                      color: _purple,
//                    ),),
//
//                  ),
//                  Padding(padding: const EdgeInsets.all(12.0),
//                    child: Text("$_percent% sind ${calculatePartAmount(_percent, _partAmount)} von $_fullAmount.", style: TextStyle(
//                      fontWeight: FontWeight.bold,
//                      fontSize: 10,
//                      color: _purple,
//                    ),),
//                  ),
//                  Padding(padding: const EdgeInsets.all(12.0),
//                    child: Text("${calculatePercentage(_partAmount, _fullAmount)}% sind $_partAmount von $_fullAmount.", style: TextStyle(
//                      fontWeight: FontWeight.bold,
//                      fontSize: 10,
//                      color: _purple,
//                    ),),
//                  ),

                ],
              ),
            ), //Prozentrechner
            Container(
              margin: EdgeInsets.only(top: 40),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.blueGrey.shade100,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                children: <Widget>[

                  Row(
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          keyboardType: TextInputType.numberWithOptions(
                              decimal: true),
                          style: TextStyle(color: _purple),
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: "Prozentwert",
                            suffixText: "%",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(0.0)),
                                borderSide: BorderSide(
                                  color: Colors.blueGrey.shade100,
                                  width: 1,
                                )
                            ),
                            labelStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: _purple,
                            ),

                          ),

                          onChanged: (String value) {
                            try {
                              _percent = double.parse(value);
                            } catch (exception) {
                              _percent = 0.0;
                            }
                          },

                        ),
                      ),
                      Flexible(
                        child: TextField(
                          keyboardType: TextInputType.numberWithOptions(
                              decimal: true),
                          style: TextStyle(color: _purple),
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: "Gesamt",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(0.0)),
                                borderSide: BorderSide(
                                  color: Colors.blueGrey.shade100,
                                  width: 1,
                                )
                            ),
                            labelStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: _purple,
                            ),


                          ),
                          onChanged: (String value) {
                            try {
                              _fullAmount = double.parse(value);
                            } catch (exception) {
                              _fullAmount = 0.0;
                            }
                          },

                        ),),
                      Flexible(
                        child: TextField(
                          keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                          style: TextStyle(color: _purple),
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: "Teil",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(0.0)),
                                borderSide: BorderSide(
                                  color: Colors.blueGrey.shade100,
                                  width: 1,
                                )
                            ),
                            labelStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: _purple,
                            ),
                          ),
                          onChanged: (String value) {
                            try {
                              _partAmount = double.parse(value);
                            } catch (exception) {
                              _partAmount = 0.0;
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),


            )


          ],

        ),
      ),


    );
  }


  calculateFullAmount(double percentage, double partAmount) {
    var fullAmount = ((partAmount / percentage) * 100);

    return fullAmount.toStringAsFixed(2);
  }

  calculatePartAmount(double percentage, double fullAmount) {
    var partAmount = (percentage / 100 * fullAmount);

    return partAmount.toStringAsFixed(2);
  }

  calculatePercentage(double partAmount, double fullAmount) {
    var percentage = (partAmount / fullAmount * 100);

    return percentage.toStringAsFixed(2);
  }

  calculateMasterPercentage(double percentage, double partAmount,
      double fullAmount) {
    if (percentage <= 0) {
      var percentage = (partAmount / fullAmount * 100);
      return "Prozentwert: $percentage";
    } else if (partAmount <= 0) {
      var partAmount = (percentage / 100 * fullAmount);
      partAmount.toStringAsFixed(2);

      return "Teilwert: $partAmount";
    } else if (fullAmount <= 0) {
      var fullAmount = ((partAmount / percentage) * 100);
      fullAmount.toStringAsFixed(0);

      return "Gesamtwert: $fullAmount";
    } else if ((partAmount >= 0) & (fullAmount >= 0) & (percentage >= 0)) {
      return "Es muss ein Wert frei bleiben";
    }
  }


  calculateEggsHeigh(double eggsHeight, double bikeFactor) {
    var frameHeight = (eggsHeight * bikeFactor);

    return frameHeight.toStringAsFixed(2);
  }

  calculateBMI(double weight, double height) {
    var bmi = (((weight / (height * height)) * 10000));

    return bmi.toStringAsFixed(1);
  }


  calculateTotalPerPerson(double billAmount, int splitBy, int tipPercentage) {
    var totalPerPerson =
        (calculateTotalTip(billAmount, splitBy, tipPercentage) + billAmount) /
            splitBy;

    return totalPerPerson.toStringAsFixed(2);
  }

  calculateTotalTip(double billAmount, int splitBy, int tipPercentage) {
    double totalTip = 0.0;

    if (billAmount < 0 || billAmount.toString().isEmpty || billAmount == null) {
      //no go!

    } else {
      totalTip = (billAmount * tipPercentage) / 100;
    }

    return totalTip;
  }
}

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
