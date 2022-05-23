import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_google_signin/page/home_page.dart';
import 'package:flutter_google_signin/provider/google_sign_in.dart';
import 'package:flutter_google_signin/widget/signup_page.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final String title = "Main Page";
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                  backgroundColor: Color.fromARGB(255, 129, 32, 255)),
              primarySwatch: Colors.blue,
            ),
            home: HomePage()
            // home: const MyHomePage(title: 'Flutter Demo Home Page'),
            ),
      );
}
