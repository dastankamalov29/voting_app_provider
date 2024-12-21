import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_app_provider/Voting%20App/provider/voting_provider.dart';

import 'Voting App/screen/voting_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=>VotingProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const VotingScreen(),
      ),
    );
  }
}

