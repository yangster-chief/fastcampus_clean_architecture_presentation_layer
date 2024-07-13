import 'package:clean_architecture_layer_exam/presentation/local_image/bloc/local_dog_images_bloc.dart';
import 'package:clean_architecture_layer_exam/presentation/widget/dog_image_card.dart';
import 'package:clean_architecture_layer_exam/presentation/widget/loading_dog_card_frame.dart';
import 'package:clean_architecture_layer_exam/presentation/widget/local_dog_card_frame.dart';
import 'package:clean_architecture_layer_exam/presentation/widget/refresh_dog_card_frame.dart';
import 'package:clean_architecture_layer_exam/presentation/widget/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

///
/// clean_architecture_layer_exam
/// File Name: local_dog_card_page
/// Created by sujangmac
///
/// Description:
///
class LocalDogCardPage extends StatefulWidget {
  const LocalDogCardPage({super.key});

  @override
  State<LocalDogCardPage> createState() => _LocalDogCardPageState();
}

class _LocalDogCardPageState extends State<LocalDogCardPage> {
  int _currentIndex = 0;

  final CardSwiperController controller = CardSwiperController();

  @override
  void initState() {
    super.initState();
    context.read<LocalDogImagesBloc>().add(const GetLocalDogImagesEvent());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<LocalDogImagesBloc, LocalDogImagesState>(
        builder: (context, state) {
          if (state is LocalDogImagesLoading) {
            return const LoadingDogCardFrame();
          } else if (state is LocalDogImagesIsEmpty) {
            return RefreshDogCardFrame(
                text: 'Empty',
                onRefresh: () {
                  context
                      .read<LocalDogImagesBloc>()
                      .add(const GetLocalDogImagesEvent());
                });
          } else if (state is LocalDogImagesLoaded) {
            final cards = state.image.map(DogImageCard.new).toList();
            return LocalDogCardFrame(
                items: state.image,
                controller: controller,
                onSwipe: _onSwipe,
                cards: cards,
                onClearAll: () {
                  context
                      .read<LocalDogImagesBloc>()
                      .add(const ClearDogImagesEvent());
                  showToastMessage('cleared');
                },
                onDelete: () {
                  context
                      .read<LocalDogImagesBloc>()
                      .add(DeleteDogImageEvent(state.image[_currentIndex].id));
                  showToastMessage('deleted');
                });
          } else {
            return RefreshDogCardFrame(
                text: 'Error',
                onRefresh: () {
                  context
                      .read<LocalDogImagesBloc>()
                      .add(const GetLocalDogImagesEvent());
                });
          }
        },
      );

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    _currentIndex = currentIndex ?? 0;
    return true;
  }
}
