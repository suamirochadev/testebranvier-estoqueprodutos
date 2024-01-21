import 'package:mobx/mobx.dart';

part 'produto_controller.g.dart';

class ProdutoController = _ProdutoController with _$ProdutoController;

abstract class _ProdutoController with Store {
  String id;
  String nome;
  double preco;

  @observable
  int quantidade;

  @observable
  bool _semEstoque;

  @computed
  bool get semEstoque => _semEstoque;

  @observable
  bool _temEstoque;

  @computed
  bool get temEstoque => _temEstoque;

  _ProdutoController({
    required this.id,
    required this.nome,
    required this.preco,
    required this.quantidade,
  })  : _semEstoque = quantidade == 0,
        _temEstoque = quantidade > 0;
}
