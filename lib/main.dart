import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  Myapp({Key? key}) : super(key: key);

  bool hasInternet = false;

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
        home: Scaffold(
          body: Center(
            child: ElevatedButton(
              onPressed: () async {
                hasInternet = await InternetConnectionChecker().hasConnection;

                final text = hasInternet ? 'Internet' : 'No connection';
                final bColor = hasInternet ? Colors.green : Colors.red;
                showSimpleNotification(Text('$text'), background: bColor);
              },
              child: Text('Check Internet'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.cyan, onPrimary: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
