import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buttons Screen')),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: const Icon(Icons.arrow_back_ios_rounded),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Wrap(alignment: WrapAlignment.center, spacing: 20, children: [
          ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
          const ElevatedButton(
              onPressed: null, child: Text('Disabled elevated')),
          ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.play_arrow),
              label: const Text('Elevated with icon')),
          FilledButton(onPressed: () {}, child: const Text('Filled')),
          FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.access_alarm),
              label: const Text('Filled icon')),
          OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
          OutlinedButton.icon(
            onPressed: () {},
            label: const Text('Outlined icon'),
            icon: const Icon(Icons.air_outlined),
          ),
          TextButton(onPressed: () {}, child: const Text('Text')),
          TextButton.icon(
              onPressed: () {},
              label: const Text('Text with icon'),
              icon: const Icon(Icons.abc)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.touch_app_rounded)),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.touch_app_rounded),
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colors.primary)),
            color: colors.onPrimary,
          ),
          _CustomButton()
        ]),
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [colors.primary, Colors.redAccent])),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Custom Button',
                style: TextStyle(color: colors.onPrimary),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
