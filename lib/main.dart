
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rivaanravat/allprovider/home_provider.dart';
import 'package:rivaanravat/screens/homescreen.dart';

void main(){
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider(),)
      ],
      child: MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homescreen(),
    );
  }
}

