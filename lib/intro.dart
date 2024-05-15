import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final _userNameController = TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Enter your name to begin:',
              style: TextStyle(fontSize: 20),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: _userNameController,
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle user input here (e.g., navigate to next page)
                // You'll implement this logic later
              },
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
