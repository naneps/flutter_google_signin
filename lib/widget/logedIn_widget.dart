import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_signin/provider/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LogedInWidegt extends StatelessWidget {
  const LogedInWidegt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text("Logged In"),
        actions: [
          IconButton(
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
              },
              icon: FaIcon(FontAwesomeIcons.signOut))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Container(
          width: double.infinity,
          // color: Color.fromARGB(255, 28, 8, 185),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 400,
                height: 300,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 95, 103, 255),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(2, 3),
                          blurRadius: 2,
                          spreadRadius: 1,
                          // blurStyle: BlurStyle.outer,
                          color: Color.fromARGB(255, 123, 123, 123))
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Profile",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 255, 240, 109),
                      radius: 45,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(user!.photoURL!),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      user.displayName!,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      user.email!,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
