import 'package:clean_architecture_layer_exam/injector.dart';
import 'package:clean_architecture_layer_exam/presentation/local_image/bloc/local_dog_images_bloc.dart';
import 'package:clean_architecture_layer_exam/presentation/local_image/local_dog_card_page.dart';
import 'package:clean_architecture_layer_exam/presentation/remote_image/bloc/remote_dog_images_bloc.dart';
import 'package:clean_architecture_layer_exam/presentation/remote_image/remote_dog_card_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

///
/// clean_architecture_layer_exam
/// File Name: dog_image_screen
/// Created by sujangmac
///
/// Description:
///
class DogImageScreen extends StatelessWidget {
  const DogImageScreen({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => locator<RemoteDogImagesBloc>()),
          BlocProvider(create: (context) => locator<LocalDogImagesBloc>()),
        ],
        child: const _DogImageScreen(),
      );
}

class _DogImageScreen extends StatefulWidget {
  const _DogImageScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<_DogImageScreen> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<_DogImageScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const RemoteDogCardPage(),
    const LocalDogCardPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('Remote Dog Image'),
                selected: _selectedIndex == 0,
                onTap: () {
                  _onItemTapped(0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Local Dog Image'),
                selected: _selectedIndex == 1,
                onTap: () {
                  _onItemTapped(1);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text('${_selectedIndex == 0 ? 'Remote' : 'Local'} Dog Image'),
        ),
        body: SafeArea(
          child: _widgetOptions[_selectedIndex],
        ),
      );
}
