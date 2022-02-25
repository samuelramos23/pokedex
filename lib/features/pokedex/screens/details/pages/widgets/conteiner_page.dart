import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/common/models/evolution.dart';
import 'package:pokedex/features/pokedex/screens/details/pages/widgets/tab_bar.dart';

class ContainerPage extends StatefulWidget {
  final TabController tabController;
  final dynamic widget;

  const ContainerPage(
      {Key? key, required this.tabController, required this.widget})
      : super(key: key);

  @override
  State<ContainerPage> createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage>
    with SingleTickerProviderStateMixin {
  final controller = GetIt.I.get<ChangeColor>();
  @override
  void initState() {
    super.initState();
    widget.tabController.addListener(() {
      controller.setTab(widget.tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    double widthContainer = MediaQuery.of(context).size.width * 0.6;
    controller.searchStats(widget.widget.pokemon.id);
    controller.searchEvolution(widget.widget.pokemon.id);
    return Container(
      constraints: const BoxConstraints(
        minHeight: 56,
        maxHeight: 390,
      ),
      width: MediaQuery.of(context).size.width,
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              automaticallyImplyLeading: false,
              flexibleSpace: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TabBar(
                    indicatorColor: widget.widget.pokemon.baseColor,
                    controller: widget.tabController,
                    tabs: <Widget>[
                      Tab(
                        child: Observer(
                          builder: (_) => Text(
                            'Sobre',
                            style: TextStyle(
                              fontSize: 12,
                              color: controller.color == true
                                  ? widget.widget.pokemon.baseColor
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Status Base',
                          style: TextStyle(
                            fontSize: 12,
                            color: controller.color2 == true
                                ? widget.widget.pokemon.baseColor
                                : Colors.black,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Evolução',
                          style: TextStyle(
                            fontSize: 12,
                            color: controller.color3 == true
                                ? widget.widget.pokemon.baseColor
                                : Colors.black,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Movimentos',
                          style: TextStyle(
                            fontSize: 12,
                            color: controller.color4 == true
                                ? widget.widget.pokemon.baseColor
                                : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: Observer(builder: (_) {
            return TabBarView(
              controller: widget.tabController,
              children: [
                const Icon(Icons.ac_unit_outlined),
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    if (controller.isLoading)
                      Padding(
                        padding: const EdgeInsets.all(80.0),
                        child: Center(
                            child: CircularProgressIndicator(
                          color: widget.widget.pokemon.baseColor,
                        )),
                      ),
                    if (!controller.isLoading)
                      for (var s in controller.stat)
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                      child: Text(
                                        controller.returnString(s.stat.name),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.09,
                                      child: Center(
                                          child: Text(s.baseStat.toString()))),
                                  SizedBox(
                                    width: 220,
                                    child: Stack(
                                      children: [
                                        Container(
                                            width: widthContainer,
                                            height: 5,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(24)),
                                              color: Colors.black12,
                                            )),
                                        Container(
                                            width: widthContainer *
                                                (s.baseStat / 200),
                                            height: 5,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(24)),
                                              color: controller
                                                  .returnColor(s.baseStat),
                                            ))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    if (controller.isLoading)
                      Padding(
                        padding: const EdgeInsets.all(80.0),
                        child: Center(
                            child: CircularProgressIndicator(
                          color: widget.widget.pokemon.baseColor,
                        )),
                      ),
                    if (!controller.isLoading)
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                  ),
                                ),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.09,
                                    child: Center(
                                        child: Text(controller
                                            .evolution!
                                            .chain
                                            .evolvesTo[0]
                                            .evolutionDetails[0]
                                            .minLevel
                                            .toString()))),
                              ],
                            ),
                          ],
                        ),
                      )
                  ],
                ),
                const Icon(Icons.ac_unit_outlined),
              ],
            );
          }),
        ),
      ),
    );
  }
}
