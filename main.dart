import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home:  compass(),
    );
  }
}



class compass extends StatefulWidget {
  const compass({Key? key}) : super(key: key);

  @override
  State<compass> createState() => _compassState();
}

class _compassState extends State<compass> {

  double? heading = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterCompass.events!.listen((event) {setState(() {
      heading = event.heading;
    });});
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: Colors.black,
    appBar: AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: Text('compass'),
    ),


    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("${heading!.ceil()}°", style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold ),),

        SizedBox(height: 50.0,),

        Padding(padding: EdgeInsets.all(18.10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset("assets/cadrant.png"),
            Transform.rotate(angle: ((heading ?? 0 ) * (pi/ 180) * -1), 
            child: Image.asset("assets/compass.png", scale: 1.1),
            ),
          ],
        ),
        ),

      ],
    ),



   );
  }
}