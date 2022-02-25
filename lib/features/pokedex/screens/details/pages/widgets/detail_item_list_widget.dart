import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';

class DetailItemListWidget extends StatelessWidget {
  const DetailItemListWidget(
      {Key? key, required this.isDiff, required this.pokemon})
      : super(key: key);
  final bool isDiff;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: isDiff ? 0.4 : 1.0,
        child: TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeIn,
          tween:
              Tween<double>(end: isDiff ? 100 : 300, begin: isDiff ? 300 : 100),
          builder: (context, value, child) {
            return Padding(
              padding: isDiff
                  ? const EdgeInsets.only(bottom: 50.0)
                  : const EdgeInsets.only(bottom: 0.0),
              child: Image.network(
                pokemon.image,
                width: value,
                fit: BoxFit.contain,
                color: isDiff ? Colors.black.withOpacity(0.4) : null,
              ),
            );
          },
        ),
      ),
    );
  }
}
