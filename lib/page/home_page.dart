import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_signin/widget/logedIn_widget.dart';
import 'package:flutter_google_signin/widget/signup_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            print(snapshot.data);
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return LogedInWidegt();
            } else if (snapshot.hasError) {
              return Center(child: Text("Ada Kesalahan ${snapshot.hasError}"));
            } else {
              return SignUpPage();
            }
          },
        ),
      );
}
