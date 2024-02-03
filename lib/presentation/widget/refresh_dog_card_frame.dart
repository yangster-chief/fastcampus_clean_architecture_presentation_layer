import 'package:flutter/material.dart';

///
/// clean_architecture_layer_exam
/// File Name: refresh_dog_card_frame
/// Created by sujangmac
///
/// Description:
///
class RefreshDogCardFrame extends StatelessWidget {
  const RefreshDogCardFrame({
    super.key,
    required this.text,
    required this.onRefresh,
  });

  final String text;
  final void Function() onRefresh;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Flexible(
            child: Center(
              child: Text(text),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.blue,
                  onPressed: onRefresh,
                  child: const Icon(Icons.refresh),
                ),
              ],
            ),
          ),
        ],
      );
}
