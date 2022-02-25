// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tab_bar.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChangeColor on _ChangeColorBase, Store {
  final _$colorAtom = Atom(name: '_ChangeColorBase.color');

  @override
  bool get color {
    _$colorAtom.reportRead();
    return super.color;
  }

  @override
  set color(bool value) {
    _$colorAtom.reportWrite(value, super.color, () {
      super.color = value;
    });
  }

  final _$color2Atom = Atom(name: '_ChangeColorBase.color2');

  @override
  bool get color2 {
    _$color2Atom.reportRead();
    return super.color2;
  }

  @override
  set color2(bool value) {
    _$color2Atom.reportWrite(value, super.color2, () {
      super.color2 = value;
    });
  }

  final _$color3Atom = Atom(name: '_ChangeColorBase.color3');

  @override
  bool get color3 {
    _$color3Atom.reportRead();
    return super.color3;
  }

  @override
  set color3(bool value) {
    _$color3Atom.reportWrite(value, super.color3, () {
      super.color3 = value;
    });
  }

  final _$color4Atom = Atom(name: '_ChangeColorBase.color4');

  @override
  bool get color4 {
    _$color4Atom.reportRead();
    return super.color4;
  }

  @override
  set color4(bool value) {
    _$color4Atom.reportWrite(value, super.color4, () {
      super.color4 = value;
    });
  }

  final _$statAtom = Atom(name: '_ChangeColorBase.stat');

  @override
  List<StatModel> get stat {
    _$statAtom.reportRead();
    return super.stat;
  }

  @override
  set stat(List<StatModel> value) {
    _$statAtom.reportWrite(value, super.stat, () {
      super.stat = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_ChangeColorBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$evolutionAtom = Atom(name: '_ChangeColorBase.evolution');

  @override
  Evolution? get evolution {
    _$evolutionAtom.reportRead();
    return super.evolution;
  }

  @override
  set evolution(Evolution? value) {
    _$evolutionAtom.reportWrite(value, super.evolution, () {
      super.evolution = value;
    });
  }

  final _$searchStatsAsyncAction = AsyncAction('_ChangeColorBase.searchStats');

  @override
  Future<void> searchStats(int id) {
    return _$searchStatsAsyncAction.run(() => super.searchStats(id));
  }

  final _$searchEvolutionAsyncAction =
      AsyncAction('_ChangeColorBase.searchEvolution');

  @override
  Future<void> searchEvolution(int id) {
    return _$searchEvolutionAsyncAction.run(() => super.searchEvolution(id));
  }

  final _$_ChangeColorBaseActionController =
      ActionController(name: '_ChangeColorBase');

  @override
  void setTab(int value) {
    final _$actionInfo = _$_ChangeColorBaseActionController.startAction(
        name: '_ChangeColorBase.setTab');
    try {
      return super.setTab(value);
    } finally {
      _$_ChangeColorBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setcolorTrue(bool value) {
    final _$actionInfo = _$_ChangeColorBaseActionController.startAction(
        name: '_ChangeColorBase.setcolorTrue');
    try {
      return super.setcolorTrue(value);
    } finally {
      _$_ChangeColorBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
color: ${color},
color2: ${color2},
color3: ${color3},
color4: ${color4},
stat: ${stat},
isLoading: ${isLoading},
evolution: ${evolution}
    ''';
  }
}
