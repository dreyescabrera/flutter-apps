import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class LoadingSpinner extends StatelessWidget {
  final bool isLoading;

  const LoadingSpinner({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SlideInUp(
      duration: const Duration(milliseconds: 300),
      animate: isLoading,
      child: Container(
        padding: const EdgeInsetsDirectional.all(5),
        decoration: BoxDecoration(
            color: colors.onPrimary,
            borderRadius: BorderRadius.circular(50),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black45,
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: Offset(0, 5))
            ]),
        child: CircularProgressIndicator(
          color: colors.primary,
          strokeWidth: 3,
        ),
      ),
    );
  }
}
