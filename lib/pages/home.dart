import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    String bgImage = data['isDayTime'] ? 'day.jpeg' : 'night.jpeg';
    Color bgColor = data['isDayTime'] ? Colors.blue[400] : Colors.blueGrey[900];
    Color textColor = data['isDayTime'] ? Colors.blueGrey[900] : Colors.blueGrey[100];
    Color editColor = data['isDayTime'] ? Colors.grey[700] : Colors.grey[400];


    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = result;
                    });
                  },
                  icon: Icon(
                      Icons.edit_location,
                    color: editColor,
                  ),
                  label: Text(
                      'Edit Location',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: editColor,
                      ),
                  )),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: textColor,
                      fontSize: 32.0,
                      letterSpacing: 2.0,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                data['time'],
                style: TextStyle(
                  color: textColor,
                  fontSize: 66.0,
                  letterSpacing: 3.0
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}