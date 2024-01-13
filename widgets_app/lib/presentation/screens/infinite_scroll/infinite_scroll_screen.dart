import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/widgets/infinite_scroll/custom_image.dart';
import 'package:widgets_app/presentation/widgets/infinite_scroll/loading_spinner.dart';

class InfiniteScrollScreen extends StatefulWidget {
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  final scrollController = ScrollController();
  final List<int> imageIds = [0, 1, 2, 3, 4, 5, 6];
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels + 100 >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  void moveScrollToBottom() {
    if (scrollController.position.pixels + 150 <=
        scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(scrollController.offset + 150,
        duration: const Duration(milliseconds: 800),
        curve: Curves.fastOutSlowIn);
  }

  void addFiveImages() {
    final lastId = imageIds.last;
    imageIds.addAll(List.generate(5, (index) => index + lastId));
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!isMounted) return;

    final lastId = imageIds.last;
    isLoading = true;
    imageIds.clear();
    imageIds.add(lastId + 1);
    setState(() {
      addFiveImages();
      isLoading = false;
    });
  }

  Future loadNextPage() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    if (!isMounted) return;

    addFiveImages();
    setState(() {
      isLoading = false;
    });

    moveScrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colors.onSurface,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: Stack(alignment: Alignment.center, children: [
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              controller: scrollController,
              itemCount: imageIds.length,
              itemBuilder: (context, index) {
                return CustomImage(
                    imageUrl:
                        'https://picsum.photos/id/${imageIds[index]}/800/500',
                    imageId: index);
              },
            ),
            Positioned(
                bottom: 20,
                child: LoadingSpinner(
                  isLoading: isLoading,
                ))
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => context.pop(()),
          child: const Icon(Icons.arrow_back_ios_new)),
    );
  }
}
