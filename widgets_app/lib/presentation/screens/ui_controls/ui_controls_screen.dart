import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { Car, Plane, Boat, Train }

enum Meal { Breakfast, Lunch, Dessert, Dinner }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = false;
  Transportation selectedTransportation = Transportation.Car;
  Set<Meal> selectedMeals = {Meal.Breakfast, Meal.Dessert};

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Additional controls'),
          value: isDeveloper,
          onChanged: (value) {
            setState(() {
              isDeveloper = value;
            });
          },
        ),
        ExpansionTile(
          title: const Text('Transportation vehicle'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
              title: const Text('By Car'),
              subtitle: const Text('Ground travel'),
              dense: true,
              value: Transportation.Car,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.Car;
              }),
            ),
            RadioListTile(
              title: const Text('By Plane'),
              subtitle: const Text('Air travel'),
              dense: true,
              value: Transportation.Plane,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.Plane;
              }),
            ),
            RadioListTile(
              title: const Text('By Boat'),
              subtitle: const Text('Sea travel'),
              dense: true,
              value: Transportation.Boat,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.Boat;
              }),
            ),
            RadioListTile(
              title: const Text('By Train'),
              subtitle: const Text('Ground travel'),
              dense: true,
              value: Transportation.Train,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.Train;
              }),
            ),
          ],
        ),
        ExpansionTile(
          title: const Text('Day Meals'),
          subtitle: selectedMeals.isNotEmpty
              ? Text(selectedMeals.join(', ').replaceAll('Meal.', ''))
              : const Text('None'),
          children: [
            CheckboxListTile(
              title: const Text('Breakfast'),
              value: selectedMeals.contains(Meal.Breakfast),
              onChanged: (value) {
                setState(() {
                  if (value == null) return;
                  value
                      ? selectedMeals.add(Meal.Breakfast)
                      : selectedMeals.remove(Meal.Breakfast);
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Lunch'),
              value: selectedMeals.contains(Meal.Lunch),
              onChanged: (value) {
                setState(() {
                  if (value == null) return;
                  value
                      ? selectedMeals.add(Meal.Lunch)
                      : selectedMeals.remove(Meal.Lunch);
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Dessert'),
              value: selectedMeals.contains(Meal.Dessert),
              onChanged: (value) {
                setState(() {
                  if (value == null) return;
                  value
                      ? selectedMeals.add(Meal.Dessert)
                      : selectedMeals.remove(Meal.Dessert);
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Dinner'),
              value: selectedMeals.contains(Meal.Dinner),
              onChanged: (value) {
                setState(() {
                  if (value == null) return;
                  value
                      ? selectedMeals.add(Meal.Dinner)
                      : selectedMeals.remove(Meal.Dinner);
                });
              },
            ),
          ],
        )
      ],
    );
  }
}
