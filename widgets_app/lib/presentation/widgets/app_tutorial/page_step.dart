import 'package:flutter/material.dart';

class PageStep extends StatelessWidget {
  final double currentPage;
  final int pagesLength;
  final void Function(int)? changePage;

  const PageStep(
      {super.key,
      required this.currentPage,
      this.changePage,
      required this.pagesLength});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final buttonsRow = List.generate(
      pagesLength,
      (index) {
        final isPrimary =
            index >= currentPage - 0.5 && index <= currentPage + 0.5;
        final size = isPrimary ? 20.0 : 15.0;

        return GestureDetector(
          onTap: () {
            if (changePage == null) return;
            changePage!(index);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: size,
                  height: size,
                  margin: const EdgeInsetsDirectional.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: isPrimary
                        ? colors.primary
                        : colors.primary.withOpacity(0.5),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: isPrimary ? size : size / 2,
                  height: size / 12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: isPrimary
                        ? colors.primary
                        : colors.primary.withOpacity(0.5),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
    return Row(children: buttonsRow);
  }
}
