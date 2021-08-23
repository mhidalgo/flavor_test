import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';


Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _counter2 = 0;
  final CollectionReference countCollection =
  FirebaseFirestore.instance.collection('count');

  void _incrementCounter() {
    setState(() {

      _counter++;
      countCollection.add({
        'black': _counter, // John Doe
        'Date_Created': DateTime.now(),
      })
          .then((value) => print("Data Added"))
          .catchError((error) => print("Failed to add data: $error"));
    });
  }

  void _incrementCounter2() {
    setState(() {

      _counter2++;
      countCollection.add({
        'red': _counter2, // John Doe
        'Date_Created': DateTime.now(),
      })
          .then((value) => print("Data Added"))
          .catchError((error) => print("Failed to add data: $error"));
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: TextStyle(color: Colors.black, fontSize: 60),
            ),
            SizedBox(height: 20,),
            Text('$_counter2',
                style: TextStyle(color: Colors.red, fontSize: 60),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: _incrementCounter, child: Text('Black'),style: ElevatedButton.styleFrom(primary: Colors.black)),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: _incrementCounter2, child: Text('Red'),style: ElevatedButton.styleFrom(primary: Colors.red))
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
