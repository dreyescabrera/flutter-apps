import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress Indicators')),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(children: [
        SizedBox(
          height: 30,
        ),
        Text('Circulas progress indicator'),
        SizedBox(
          height: 10,
        ),
        CircularProgressIndicator(
          strokeWidth: 1,
          backgroundColor: Colors.black38,
        ),
        SizedBox(
          height: 30,
        ),
        Text('Controlled progress indicators'),
        SizedBox(
          height: 10,
        ),
        _ControlledProgressIndicator()
      ]),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<double>(
        stream: Stream.periodic(const Duration(milliseconds: 20),
            (computationCount) {
          return (computationCount * 0.33) / 100;
        }).takeWhile((computationCount) => computationCount <= 1),
        builder: (context, snapshot) {
          final progressValue = snapshot.data;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              CircularProgressIndicator(
                value: progressValue,
                strokeWidth: 2,
                backgroundColor: Colors.black26,
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  child: LinearProgressIndicator(
                value: progressValue,
              ))
            ]),
          );
        });
  }
}
