// ignore_for_file: prefer_const_constructors
import 'package:bloc_state_management/bloc/color_bloc.dart';
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
      home:
          BlocProvider(create: (_) => ColorBloc(), child: const ColorScreen()),
    );
  }
}

class ColorScreen extends StatefulWidget {
  const ColorScreen({super.key});

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    context.read<ColorBloc>().add(InitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('colorz'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<ColorBloc, ColorState>(listener: (context, state) {
            print(state);
          }, builder: (context, state) {
            if (state is ColorUpdateState) {
              return Column(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    color: state.initialState == true ? Colors.blue : Colors.red,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () =>
                            context.read<ColorBloc>().add(ColorToBlue()),
                        child: Container(
                          width: 50,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                          ),
                          child: Center(child: Text('blue')),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () =>
                            context.read<ColorBloc>().add(ColorToRed()),
                        child: Container(
                          width: 50,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.red,
                          ),
                          child: Center(child: Text('red')),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            } else {
              return Container();
            }
          }),
        ],
      ),
    );
  }
}
