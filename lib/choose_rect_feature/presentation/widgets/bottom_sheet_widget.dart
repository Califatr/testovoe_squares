import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../manager/choose_history_provider.dart';

class SquareBottomSheet extends StatelessWidget {
  final double cardHeight = 100.0;

  const SquareBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final squareProvider = Provider.of<SquareProvider>(context, listen: false);
    final int squareCount = Random().nextInt(20) + 1;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double minChildSize = cardHeight / screenHeight;

    final double childSize = ((cardHeight + 4) * squareCount + 36);
    final double initialChildSize =
        (childSize <= screenHeight * 0.5) ? childSize / screenHeight : 0.6;
    final double maxChildSize =
        (childSize <= screenHeight) ? childSize / screenHeight : 0.95;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: DraggableScrollableSheet(
        expand: false,
        initialChildSize: initialChildSize,
        minChildSize: minChildSize,
        maxChildSize: maxChildSize,
        builder: (BuildContext context, ScrollController scrollController) {
          return ListView.separated(
            controller: scrollController,
            itemCount: squareCount,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  squareProvider.selectSquare(index + 1);
                  Navigator.pop(context);
                },
                child: Container(
                  height: 100,
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 4,
              );
            },
          );
        },
      ),
    );
  }
}
