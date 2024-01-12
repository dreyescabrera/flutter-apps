import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 0.5, 'label': 'Elevation 0.5'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
  {'elevation': 1.5, 'label': 'Elevation 1.5'},
  {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 2.5, 'label': 'Elevation 2.5'},
];

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cards Screen')),
      body: const _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      ...cards
          .map((card) => _CustomCard1(
                elevation: card['elevation'],
                label: card['label'],
              ))
          .toList(),
      ...cards
          .map((card) => _CustomCard2(
                elevation: card['elevation'],
                label: card['label'],
              ))
          .toList(),
      ...cards
          .map((card) => _CustomCard3(
                elevation: card['elevation'],
                label: card['label'],
              ))
          .toList(),
      ...cards
          .map((card) => _CustomCard4(
                elevation: card['elevation'],
              ))
          .toList(),
      const SizedBox(
        height: 50,
      )
    ]));
  }
}

class _CustomCard1 extends StatelessWidget {
  final double elevation;
  final String label;

  const _CustomCard1({required this.elevation, required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
        child: Row(
          children: [
            Expanded(child: Text(label)),
            const Icon(Icons.more_vert),
          ],
        ),
      ),
    );
  }
}

class _CustomCard2 extends StatelessWidget {
  final double elevation;
  final String label;

  const _CustomCard2({required this.elevation, required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      shape: RoundedRectangleBorder(
          side: BorderSide(
            color: colors.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
        child: Row(
          children: [
            Expanded(child: Text('$label - outline')),
            const Icon(Icons.more_vert),
          ],
        ),
      ),
    );
  }
}

class _CustomCard3 extends StatelessWidget {
  final double elevation;
  final String label;

  const _CustomCard3({required this.elevation, required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      color: colors.surfaceVariant,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
        child: Row(
          children: [
            Expanded(child: Text('$label - filled')),
            const Icon(Icons.more_vert),
          ],
        ),
      ),
    );
  }
}

class _CustomCard4 extends StatelessWidget {
  final double elevation;

  const _CustomCard4({required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      clipBehavior: Clip.hardEdge,
      color: colors.surfaceVariant,
      elevation: elevation,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              'https://picsum.photos/id/${elevation.toInt()}/600/350',
            ),
          ),
          Align(
              alignment: Alignment.topRight,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.only(bottomLeft: Radius.circular(20)),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: MaterialButton(
                    height: double.maxFinite,
                    onPressed: () {},
                    child: const Icon(Icons.more_vert),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
