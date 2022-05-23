import 'package:flutter/material.dart';
import 'package:flutter_google_signin/provider/google_sign_in.dart';
import 'package:flutter_google_signin/widget/texf_field_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool showPass = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign Up',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
            ),
            MyTextField(
              icon: Icons.email,
              hintText: "Email",
            ),
            SizedBox(
              height: 15,
            ),
            MyTextField(
              showPass: showPass,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    showPass = !showPass;
                  });
                  // print(showPass);
                },
                child: Icon(showPass ? Icons.visibility : Icons.visibility_off),
              ),
              icon: FontAwesomeIcons.lock,
              // showPass: ,
              hintText: "Password",
            ),
            SizedBox(
              height: 15,
            ),
            Text("OR"),
            SizedBox(
              height: 15,
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    minimumSize: Size(double.infinity, 50)),
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googleLogin();
                },
                icon: FaIcon(
                  FontAwesomeIcons.google,
                  color: Colors.red,
                ),
                label: Text("Sign Up with Google")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 25, 36, 255),
                    onPrimary: Colors.white,
                    minimumSize: Size(double.infinity, 50)),
                onPressed: () {},
                icon: FaIcon(
                  FontAwesomeIcons.facebook,
                  color: Color.fromARGB(255, 230, 230, 230),
                ),
                label: Text("Sign Up with Facebook")),
          ],
        ),
      ),
    );
  }
}
