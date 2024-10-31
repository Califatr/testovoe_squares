import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../manager/choose_history_provider.dart';
import '../widgets/bottom_sheet_widget.dart';

class ChooseHistoryScreen extends StatelessWidget {
  const ChooseHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final squareProvider = Provider.of<SquareProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Нажмите "Выбрать квадратик", чтобы открыть список и выбрать номер.',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _showBottomSheet(context),
                child: const Text('Выбрать квадратик'),
              ),
              const SizedBox(height: 20),
              Text(
                'История выборов:\n${squareProvider.history.join(', ')}',
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const SquareBottomSheet(),
    );
  }
}
