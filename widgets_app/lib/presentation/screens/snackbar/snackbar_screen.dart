import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  const SnackbarScreen({super.key});

  void showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(SnackBar(
        content: const Text('Hey you'),
        duration: const Duration(seconds: 1),
        action: SnackBarAction(label: 'Undo', onPressed: () {}),
      ));
  }

  void openDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: const Text('Are you sure?'),
              content: const Text(
                  'Ut sit anim aliquip duis amet consectetur laboris. Commodo non qui nulla exercitation minim duis ullamco pariatur irure laborum labore exercitation officia et. Aute ullamco veniam commodo eu magna cupidatat ipsum magna veniam eu. Incididunt anim ullamco fugiat labore id deserunt irure tempor ut occaecat ex ad anim. Amet duis duis nisi enim anim et exercitation commodo pariatur reprehenderit tempor sint est. Adipisicing esse quis ut magna nisi nostrud nulla consequat velit aute culpa dolore ex. Consequat ea ea enim labore labore in minim cillum.'),
              actions: [
                TextButton(
                    onPressed: () => context.pop(),
                    child: const Text('Cancel')),
                FilledButton(onPressed: () {}, child: const Text('Accept')),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snack bars and Dialogs')),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Show snack bar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showSnackBar(context),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  const Text(
                      'Culpa laboris amet non amet aliqua incididunt ad non exercitation et. Ullamco anim ea incididunt ipsum eiusmod proident tempor enim laboris tempor qui. Mollit enim reprehenderit laborum voluptate velit qui do duis consectetur ea. Elit ea laborum occaecat commodo dolore exercitation mollit mollit reprehenderit. Lorem occaecat dolore velit nulla consectetur qui id eu labore adipisicing quis aliqua consequat. Deserunt sint occaecat sit laboris. Amet labore consectetur veniam et enim.')
                ]);
              },
              child: const Text('Used Licenses')),
          FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Show Dialog')),
        ],
      )),
    );
  }
}
