import 'package:mobx/mobx.dart';

// Modelo de produto para passar algumas informações

class ProdutoModel {
  String id;
  String nome;
  double preco;

  @observable
  int quantidade;

  @computed
  bool get temEstoque => quantidade > 0;

  @computed
  bool get semEstoque => quantidade == 0;

  ProdutoModel({
    required this.id,
    required this.nome,
    required this.preco,
    required this.quantidade,
  });
}
