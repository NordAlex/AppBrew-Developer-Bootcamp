import 'package:flutter/material.dart';

void main() => runApp(MyApp());

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
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('images/alex.jpg'),
              radius: 60,
            ),
            const Text(
              'Alexander Olshansky',
              style: TextStyle(
                  color: Colors.white, fontSize: 30, fontFamily: 'Pacifico'),
            ),
            const Text(
              'Software developer',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Source Sans Pro'),
            ),
            SizedBox(
                height: 20,
                width: 150,
                child: Divider(
                  color: Colors.white,
                )),
            Card(
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.teal,
                ),
                title: const Text(
                  '+1234567890',
                  style: TextStyle(color: Colors.teal),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.teal,
                ),
                title: const Text(
                  'test@mail.com',
                  style: TextStyle(color: Colors.teal),
                ),
              ),
            ),
          ],
        ));
  }
}
