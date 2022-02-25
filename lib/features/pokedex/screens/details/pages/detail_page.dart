import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/pokedex/screens/details/pages/widgets/conteiner_page.dart';
import 'package:pokedex/features/pokedex/screens/details/pages/widgets/detail_item_list_widget.dart';

import 'widgets/detail_app_bar_widget.dart';
import 'widgets/detail_list_widget.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    Key? key,
    required this.pokemon,
    required this.list,
    required this.onBack,
    required this.controller,
    required this.onChangePokemon,
  }) : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> list;
  final VoidCallback onBack;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  late ScrollController scrollController;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    tabController = TabController(length: 4, vsync: this);
    widget.controller.addListener;
  }

  bool isOnTop = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
        onNotification: (notification) {
          setState(() {
            if (scrollController.position.pixels > 37) {
              isOnTop = false;
            } else if (scrollController.position.pixels <= 36) {
              isOnTop = true;
            }
          });
          return false;
        },
        child: CustomScrollView(
          controller: scrollController,
          physics: const ClampingScrollPhysics(),
          slivers: [
            DetailAppBarWidget(
              pokemon: widget.pokemon,
              onBack: widget.onBack,
              isOnTop: isOnTop,
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    DetailListWidget(
                      pokemon: widget.pokemon,
                      list: widget.list,
                      controller: widget.controller,
                      onChangePokemon: widget.onChangePokemon,
                    ),
                    Positioned(
                        right: -20,
                        bottom: 420,
                        child: Opacity(
                          opacity: 0.3,
                          child: Image.asset(
                            'assets/images/pokeball.png',
                            height: 260,
                            fit: BoxFit.fitHeight,
                          ),
                        )),
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 360.0),
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  child: Column(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(9.0),
                                      ),
                                      ContainerPage(
                                          tabController: tabController,
                                          widget: widget)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 400,
                          width: double.infinity,
                          child: PageView(
                            onPageChanged: (index) =>
                                widget.onChangePokemon(widget.list[index]),
                            controller: widget.controller,
                            children: <Widget>[
                              for (var e in widget.list)
                                DetailItemListWidget(
                                  isDiff: e.name != widget.pokemon.name,
                                  pokemon: e,
                                )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
