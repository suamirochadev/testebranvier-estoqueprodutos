// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estoque_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EstoqueController on _EstoqueController, Store {
  Computed<int>? _$totalItensComputed;

  @override
  int get totalItens =>
      (_$totalItensComputed ??= Computed<int>(() => super.totalItens,
              name: '_EstoqueController.totalItens'))
          .value;

  late final _$produtosAtom =
      Atom(name: '_EstoqueController.produtos', context: context);

  @override
  ObservableList<ProdutoModel> get produtos {
    _$produtosAtom.reportRead();
    return super.produtos;
  }

  @override
  set produtos(ObservableList<ProdutoModel> value) {
    _$produtosAtom.reportWrite(value, super.produtos, () {
      super.produtos = value;
    });
  }

  late final _$_EstoqueControllerActionController =
      ActionController(name: '_EstoqueController', context: context);

  @override
  void adicionarProduto(ProdutoModel produto) {
    final _$actionInfo = _$_EstoqueControllerActionController.startAction(
        name: '_EstoqueController.adicionarProduto');
    try {
      return super.adicionarProduto(produto);
    } finally {
      _$_EstoqueControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removerProduto(String id) {
    final _$actionInfo = _$_EstoqueControllerActionController.startAction(
        name: '_EstoqueController.removerProduto');
    try {
      return super.removerProduto(id);
    } finally {
      _$_EstoqueControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void aumentarQuantidade(String id, int quantidade) {
    final _$actionInfo = _$_EstoqueControllerActionController.startAction(
        name: '_EstoqueController.aumentarQuantidade');
    try {
      return super.aumentarQuantidade(id, quantidade);
    } finally {
      _$_EstoqueControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void diminuirQuantidade(String id, int quantidade) {
    final _$actionInfo = _$_EstoqueControllerActionController.startAction(
        name: '_EstoqueController.diminuirQuantidade');
    try {
      return super.diminuirQuantidade(id, quantidade);
    } finally {
      _$_EstoqueControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editarProduto(String id, ProdutoModel novoProduto) {
    final _$actionInfo = _$_EstoqueControllerActionController.startAction(
        name: '_EstoqueController.editarProduto');
    try {
      return super.editarProduto(id, novoProduto);
    } finally {
      _$_EstoqueControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  ProdutoModel getProdutoById(String id) {
    final _$actionInfo = _$_EstoqueControllerActionController.startAction(
        name: '_EstoqueController.getProdutoById');
    try {
      return super.getProdutoById(id);
    } finally {
      _$_EstoqueControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
produtos: ${produtos},
totalItens: ${totalItens}
    ''';
  }
}
