import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/pokedex/screens/home/pages/widgets/type_widget.dart';

class DetailListWidget extends StatelessWidget {
  const DetailListWidget({
    Key? key,
    required this.pokemon,
    required this.list,
    required this.controller,
    required this.onChangePokemon,
  }) : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> list;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: pokemon.baseColor,
      child: Stack(
        children: [
          Positioned(
              right: -40,
              bottom: -20,
              child: Opacity(
                opacity: 0.3,
                child: Image.asset(
                  'assets/images/pokeball.png',
                  height: 260,
                  fit: BoxFit.fitHeight,
                ),
              )),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        pokemon.name,
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      '#${pokemon.num}',
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: pokemon.type
                          .map((e) => TypeWidget(
                                name: e,
                                firstScreen: false,
                              ))
                          .toList(),
                    ),
                    const Flexible(
                        child: SizedBox(
                      height: 50,
                      width: 50,
                    )),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
