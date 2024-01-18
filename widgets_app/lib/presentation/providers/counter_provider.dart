import 'package:flutter_riverpod/flutter_riverpod.dart';

const int _initialValue = 5;

final counterProvider = StateProvider((_) => _initialValue);
