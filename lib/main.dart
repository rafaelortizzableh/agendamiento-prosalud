import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'core/core.dart';
import 'app.dart';

void main() {
  configureApp();
  runApp(
    const ProviderScope(
      child: ProsaludApp(),
    ),
  );
}
