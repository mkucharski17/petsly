import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue, textTheme: TextTheme()),
      title: 'Petsly',
      home: FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return Text('sth went wrong');
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            print(_initialization.toString());
            return Text('my app');
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return Text('Loading');
        },
      ),
    );
  }
}
