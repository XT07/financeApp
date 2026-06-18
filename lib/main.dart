import 'package:flutter/material.dart';
import './schreems/registerSchreem.dart';
import "./schreems/historySchreem.dart";

void main() => runApp(Finance());

class Finance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance App',
      theme: ThemeData(colorSchemeSeed: Colors.indigo),
      home: principalScreem(),
    );
  }
}

class principalScreem extends StatefulWidget {
  @override
  _principalSchreemState createState() => _principalSchreemState();
}

class _principalSchreemState extends State<principalScreem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Finance App')),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => registerSchreem()),
                );
              },

              child: Text(
                'Registrar',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => historySchreem()),
                );
              },

              child: Text(
                "Histórico",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
