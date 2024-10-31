import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'choose_rect_feature/presentation/manager/choose_history_provider.dart';
import 'choose_rect_feature/presentation/screens/choose_history_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SquareProvider()),
      ],
      child: const MaterialApp(
        home: ChooseHistoryScreen(),
      ),
    );
  }
}
