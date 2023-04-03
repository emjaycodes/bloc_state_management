import 'package:bloc_state_management/Colour_Bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: (_) => ChangeColourCubit(true), child: const ColorScreen()),
    );
  }
}

class ColorScreen extends StatelessWidget {
  const ColorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('colorz'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Background color
                ),
                child: Text('blue'),
              ),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: null, child: Text('red'),
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Background color
  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
