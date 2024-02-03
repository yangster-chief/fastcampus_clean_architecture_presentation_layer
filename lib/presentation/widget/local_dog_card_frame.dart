import 'package:clean_architecture_layer_exam/domain/entity/dog_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

///
/// clean_architecture_layer_exam
/// File Name: local_dog_card_frame
/// Created by sujangmac
///
/// Description:
///
class LocalDogCardFrame extends StatelessWidget {
  const LocalDogCardFrame({
    super.key,
    required this.items,
    required this.controller,
    required this.onSwipe,
    required this.cards,
    required this.onClearAll,
    required this.onDelete,
  });
  final List<DogImage> items;
  final CardSwiperController controller;
  final bool Function(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) onSwipe;
  final List<Widget> cards;
  final void Function() onClearAll;
  final void Function() onDelete;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Flexible(
            child: CardSwiper(
              controller: controller,
              cardsCount: items.length,
              onSwipe: onSwipe,
              numberOfCardsDisplayed: items.length,
              backCardOffset: const Offset(40, 40),
              padding: const EdgeInsets.all(24.0),
              cardBuilder: (
                context,
                index,
                horizontalThresholdPercentage,
                verticalThresholdPercentage,
              ) =>
                  cards[index],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.grey,
                  onPressed: onClearAll,
                  child: const Icon(Icons.clear),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: onDelete,
                  child: const Icon(Icons.delete),
                ),
              ],
            ),
          ),
        ],
      );
}
