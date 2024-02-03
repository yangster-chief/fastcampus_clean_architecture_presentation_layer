import 'package:clean_architecture_layer_exam/injector.dart';
import 'package:clean_architecture_layer_exam/presentation/dog_image_screen.dart';
import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Loggy.initLoggy();
  await configureDependencies();
  runApp(
    MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DogImageScreen(),
    ),
  );
}
