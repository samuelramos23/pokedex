import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/common/consts/api_consts.dart';
import 'package:pokedex/common/models/evolution.dart';
import 'package:pokedex/common/models/stat.dart';
part 'tab_bar.g.dart';

class ChangeColor = _ChangeColorBase with _$ChangeColor;

abstract class _ChangeColorBase with Store {
  @observable
  bool color = false;

  @observable
  bool color2 = false;

  @observable
  bool color3 = false;

  @observable
  bool color4 = false;

  @action
  void setTab(int value) {
    switch (value) {
      case 0:
        color = true;
        color2 = false;
        color3 = false;
        color4 = false;
        break;
      case 1:
        color = false;
        color2 = true;
        color3 = false;
        color4 = false;
        break;
      case 2:
        color = false;
        color2 = false;
        color3 = true;
        color4 = false;
        break;
      case 3:
        color = false;
        color2 = false;
        color3 = false;
        color4 = true;
        break;
    }
  }

  @action
  void setcolorTrue(bool value) {
    color = value;
  }

  @observable
  List<StatModel> stat = [];

  @observable
  bool isLoading = false;

  @action
  Future<void> searchStats(int id) async {
    isLoading = true;
    Dio dio = Dio();
    stat = [];
    try {
      var response =
          await dio.get(ApiConsts.pokeapiv2URL + "/" + id.toString());
      stat = List.from(response.data["stats"])
          .map((e) => StatModel.fromJson(e))
          .toList();
      isLoading = false;
    } catch (e) {
      isLoading = false;
    }
  }

  @observable
  Evolution? evolution;

  @action
  Future<void> searchEvolution(int id) async {
    isLoading = true;
    Dio dio = Dio();
    try {
      var response =
          await dio.get(ApiConsts.pokeapiv2EvolutionURL + "/" + id.toString());
      /* evolution =
          List.from(response.data).map((e) => Evolution.fromJson(e)).toList(); */
      evolution = Evolution.fromJson(response.data);
      isLoading = false;
    } catch (e) {
      print(e);
      isLoading = false;
    }
  }

  MaterialColor returnColor(int value) {
    if (value < 50) {
      return Colors.red;
    } else if (value < 99) {
      return Colors.green;
    } else if (value < 150) {
      return Colors.blue;
    } else {
      return Colors.purple;
    }
  }

  String returnString(String value) {
    if (value == 'hp') {
      return 'HP';
    } else if (value == 'attack') {
      return 'Attack';
    } else if (value == 'defense') {
      return 'Defense';
    } else if (value == 'special-attack') {
      return 'Sp. Attack';
    } else if (value == 'special-defense') {
      return 'Sp. Defense';
    } else {
      return 'Speed';
    }
  }
}
