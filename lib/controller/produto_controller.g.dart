// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProdutoController on _ProdutoController, Store {
  Computed<bool>? _$semEstoqueComputed;

  @override
  bool get semEstoque =>
      (_$semEstoqueComputed ??= Computed<bool>(() => super.semEstoque,
              name: '_ProdutoController.semEstoque'))
          .value;
  Computed<bool>? _$temEstoqueComputed;

  @override
  bool get temEstoque =>
      (_$temEstoqueComputed ??= Computed<bool>(() => super.temEstoque,
              name: '_ProdutoController.temEstoque'))
          .value;

  late final _$quantidadeAtom =
      Atom(name: '_ProdutoController.quantidade', context: context);

  @override
  int get quantidade {
    _$quantidadeAtom.reportRead();
    return super.quantidade;
  }

  @override
  set quantidade(int value) {
    _$quantidadeAtom.reportWrite(value, super.quantidade, () {
      super.quantidade = value;
    });
  }

  late final _$_semEstoqueAtom =
      Atom(name: '_ProdutoController._semEstoque', context: context);

  @override
  bool get _semEstoque {
    _$_semEstoqueAtom.reportRead();
    return super._semEstoque;
  }

  @override
  set _semEstoque(bool value) {
    _$_semEstoqueAtom.reportWrite(value, super._semEstoque, () {
      super._semEstoque = value;
    });
  }

  late final _$_temEstoqueAtom =
      Atom(name: '_ProdutoController._temEstoque', context: context);

  @override
  bool get _temEstoque {
    _$_temEstoqueAtom.reportRead();
    return super._temEstoque;
  }

  @override
  set _temEstoque(bool value) {
    _$_temEstoqueAtom.reportWrite(value, super._temEstoque, () {
      super._temEstoque = value;
    });
  }

  @override
  String toString() {
    return '''
quantidade: ${quantidade},
semEstoque: ${semEstoque},
temEstoque: ${temEstoque}
    ''';
  }
}
