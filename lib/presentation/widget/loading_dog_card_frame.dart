import 'package:flutter/material.dart';

///
/// clean_architecture_layer_exam
/// File Name: loading_dog_card_frame
/// Created by sujangmac
///
/// Description:
///
class LoadingDogCardFrame extends StatelessWidget {
  const LoadingDogCardFrame({super.key});

  @override
  Widget build(BuildContext context) =>
      const Center(child: CircularProgressIndicator());
}
