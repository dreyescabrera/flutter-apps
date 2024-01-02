import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/screens/counter/confetti_button.dart';
import 'package:flutter_application_1/presentation/screens/counter/counter_button.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CounterScreen();
}

class _CounterScreen extends State<CounterScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                counter = 0;
              });
            },
            icon: const Icon(Icons.refresh_rounded),
          )
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: (counter.toString().length * 20) + 30,
            height: (counter.toString().length * 20) + 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.black87,
            ),
            alignment: Alignment.center,
            child: Text(
              '$counter',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text('Your current count',
              style: TextStyle(
                color: Color.fromRGBO(159, 163, 172, 1),
                fontSize: 18,
              )),
          const SizedBox(
            height: 24,
          ),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 5,
            children: [
              CounterButton(
                label: 'Decrement',
                icon: Icons.remove,
                onPressed: () => setState(() {
                  if (counter <= 0) return;
                  counter--;
                }),
              ),
              CounterButton(
                label: 'Reset',
                icon: Icons.restore,
                onPressed: () => setState(() => counter = 0),
              ),
              CounterButton(
                label: 'Increment',
                icon: Icons.add,
                onPressed: () => setState(() => counter++),
              ),
              const ConfettiButton()
            ],
          ),
        ],
      )),
    );
  }
}
