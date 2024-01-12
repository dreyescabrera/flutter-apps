import 'dart:async';
import 'package:flutter/material.dart';

class Debouncer {
  Debouncer({required this.milliseconds});
  final int milliseconds;
  Timer? _timer;
  void run(VoidCallback action) {
    if (_timer?.isActive ?? false) {
      return;
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
