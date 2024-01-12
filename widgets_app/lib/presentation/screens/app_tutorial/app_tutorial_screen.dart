import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/helpers/debouncer.dart';
import 'package:widgets_app/config/helpers/slide_info.dart';
import 'package:widgets_app/presentation/widgets/app_tutorial/page_step.dart';
import 'package:widgets_app/presentation/widgets/app_tutorial/slide.dart';

final debouncer = Debouncer(milliseconds: 80);

final slides = <SlideInfo>[
  const SlideInfo('Look for food', 'Eu in veniam reprehenderit sit.',
      'assets/images/1.png'),
  const SlideInfo(
      'Fast delivery',
      'Nulla non non elit quis cupidatat dolor non proident ullamco.',
      'assets/images/2.png'),
  const SlideInfo(
      'Enjoy your food',
      'Sint laborum id pariatur deserunt eu nulla commodo nostrud fugiat nulla aliquip veniam.',
      'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final pageViewController = PageController();
  double currentPage = 0;
  bool hasReachedEnd = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;

      debouncer.run(
        () => setState(() {
          currentPage = page;
        }),
      );

      if (!hasReachedEnd && page >= slides.length - 1.5) {
        setState(() {
          hasReachedEnd = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slide) => Slide(
                    title: slide.title,
                    caption: slide.caption,
                    imageUrl: slide.imageUrl))
                .toList()),
        Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              child: const Text('Return to Home'),
              onPressed: () => context.pop(),
            )),
        Positioned(
            bottom: 100,
            child: PageStep(
              pagesLength: slides.length,
              currentPage: currentPage,
              changePage: (page) => pageViewController.animateToPage(page,
                  duration: const Duration(
                    milliseconds: 250,
                  ),
                  curve: Curves.easeInOut),
            )),
        if (hasReachedEnd)
          Positioned(
              bottom: 30,
              right: 30,
              child: FadeInRight(
                from: 15,
                delay: const Duration(milliseconds: 100),
                child: FilledButton(
                  onPressed: () => context.pop(),
                  child: const Text('Start'),
                ),
              ))
      ]),
    );
  }
}
