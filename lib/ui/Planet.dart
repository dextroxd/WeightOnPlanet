import 'package:flutter/material.dart';

class Planet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new PlanetState();
  }
}

class PlanetState extends State<Planet> {
  final TextEditingController _weightController = new TextEditingController();
  int radioValue = 0;
  double _weight = 0.0;
  String _formattedText = "";

  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
      switch (radioValue) {
        case 0:
          _weight = calculateWeight(_weightController.text, 0.06);
          _formattedText = "Your weight on Pluto is ${_weight.toStringAsFixed(1)} lbs.";
          break;
        case 1:
          _weight = calculateWeight(_weightController.text, 0.38);
          _formattedText = "Your weight on Mars is ${_weight.toStringAsFixed(1)} lbs.";
          break;
        case 2:
          _weight = calculateWeight(_weightController.text, 0.91);
          _formattedText = "Your weight on Venus is ${_weight.toStringAsFixed(1)} lbs.";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.black38,
        title: new Text(
          "Weight On Planet X",
          style: new TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey.shade400,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset(
              'images/planet_image.png',
              height: 133.0,
              width: 200.0,
            ),
            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: new TextField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          labelText: "Your Weight on Earth",
                          hintText: "In Pounds",
                          icon: new Icon(Icons.person_outline)),
                    ),
                  ),
                  new Padding(padding: new EdgeInsets.all(5.0)),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio<int>(
                          activeColor: Colors.brown,
                          value: 0,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      new Text(
                        "Pluto",
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      new Radio<int>(
                          activeColor: Colors.red,
                          value: 1,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      new Text(
                        "Mars",
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      new Radio<int>(
                          activeColor: Colors.orangeAccent,
                          value: 2,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      new Text(
                        "Venus",
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  new Padding(padding: new EdgeInsets.all(15.6)),
                  new Text(
                    _weightController.text.isEmpty?"Please enter weight":_formattedText,
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 19.4,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double calculateWeight(String text, double d) {
    if (int.parse(text).toString().isNotEmpty && int.parse(text) > 0) {
      return int.parse(text) * d;
    } else {
      print("Wrong");
      return int.parse("180") * 0.38;
    }
  }
}
