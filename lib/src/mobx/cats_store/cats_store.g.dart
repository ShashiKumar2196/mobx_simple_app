// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cats_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CatsStore on _CatsStore, Store {
  Computed<int>? _$factsComputed;

  @override
  int get facts => (_$factsComputed ??=
          Computed<int>(() => super.facts, name: '_CatsStore.facts'))
      .value;
  Computed<String>? _$factsReadComputed;

  @override
  String get factsRead => (_$factsReadComputed ??=
          Computed<String>(() => super.factsRead, name: '_CatsStore.factsRead'))
      .value;

  final _$catFactsAtom = Atom(name: '_CatsStore.catFacts');

  @override
  List<CatFact> get catFacts {
    _$catFactsAtom.reportRead();
    return super.catFacts;
  }

  @override
  set catFacts(List<CatFact> value) {
    _$catFactsAtom.reportWrite(value, super.catFacts, () {
      super.catFacts = value;
    });
  }

  final _$stateAtom = Atom(name: '_CatsStore.state');

  @override
  loadingState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(loadingState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$factsReadCountAtom = Atom(name: '_CatsStore.factsReadCount');

  @override
  int get factsReadCount {
    _$factsReadCountAtom.reportRead();
    return super.factsReadCount;
  }

  @override
  set factsReadCount(int value) {
    _$factsReadCountAtom.reportWrite(value, super.factsReadCount, () {
      super.factsReadCount = value;
    });
  }

  final _$fetchCatsFactsAsyncAction = AsyncAction('_CatsStore.fetchCatsFacts');

  @override
  Future<void> fetchCatsFacts() {
    return _$fetchCatsFactsAsyncAction.run(() => super.fetchCatsFacts());
  }

  final _$_CatsStoreActionController = ActionController(name: '_CatsStore');

  @override
  void incrementFactsRead() {
    final _$actionInfo = _$_CatsStoreActionController.startAction(
        name: '_CatsStore.incrementFactsRead');
    try {
      return super.incrementFactsRead();
    } finally {
      _$_CatsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
catFacts: ${catFacts},
state: ${state},
factsReadCount: ${factsReadCount},
facts: ${facts},
factsRead: ${factsRead}
    ''';
  }
}
