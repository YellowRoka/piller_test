import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piller_test/feature/splash_page/cubit/splash_page_cubit.dart';
import 'package:video_player/video_player.dart';

class SplashPageBody extends StatelessWidget {
  const SplashPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    late  VideoPlayerController controller;
    final SplashPageCubit       splashPageCubit = context.read<SplashPageCubit>();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => context.read<SplashPageCubit>().loadVideoLink()
    );

    return Center(
      child: BlocConsumer<SplashPageCubit, SplashPageState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse:     (){},
            initial:    () async => splashPageCubit.loadVideoLink(),
            goNextPage: () async => controller..pause()..dispose(),
          );
        },
      
        builder: (context, state) {
          return state.maybeWhen(
            orElse:        () => SizedBox(),
            loadVideoLink: (videoLink){
              controller = VideoPlayerController.asset(videoLink);
              controller.initialize().then( (_) => controller.play() );
              controller.addListener(
                () {
                  if(controller.value.isCompleted){
                    splashPageCubit.stepNextPage();
                  }
                }
              );
              return AspectRatio( 
                aspectRatio: controller.value.aspectRatio,
                child:       VideoPlayer(controller)
              );
            },
          );
        },
      ),
    );
  }
}
