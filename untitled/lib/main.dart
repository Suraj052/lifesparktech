import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/chat_provider.dart';
import 'package:untitled/view/home_screen.dart';

void main() async{


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

 runApp(
     ChangeNotifierProvider(
   create : (BuildContext context) => ChatProvider(),
   child: MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
   ),
 ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}
