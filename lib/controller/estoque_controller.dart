import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:testebranvier/model/produto_model.dart';

part 'estoque_controller.g.dart';

// Aqui é pagina Controller onde utilizamos @Action e @Observable

// Nessa primeira linha usamos as formas que o mobx usa para se comunicar com 
// a parte do codigo que vai pra interface.
class EstoqueController = _EstoqueController with _$EstoqueController;

//Aqui criamos uma classe abstrata que serve como um controlador de estado para
//o estoque. Ele usa a reatividade do Mobx usando o @Observable e também as
//incorpora com o Provider, passando o ChangeNotifier ao lado do Store.
abstract class _EstoqueController with Store, ChangeNotifier {
  @observable
  ObservableList<ProdutoModel> produtos = ObservableList<ProdutoModel>();

//As action são as funções que modificam o estado observável. Unica forma de
//mudar o estado.

//Adiciona novo produto
@action
  void adicionarProduto(ProdutoModel produto) {
    produto.quantidade = produto.quantidade;
    produtos.add(produto);
    notifyListeners();
  }

// Remove o produto
  @action
  void removerProduto(String id) {
    produtos.removeWhere((produto) => produto.id == id);
    notifyListeners();
  }

// Aumenta a quantidade do produto
  @action
  void aumentarQuantidade(String id, int quantidade) {
    final produto = produtos.firstWhere((produto) => produto.id == id);
    produto.quantidade += quantidade;
    notifyListeners();
  }
  
 // Diminui a quantidade produto
  @action
  void diminuirQuantidade(String id, int quantidade) {
    final produto = produtos.firstWhere((produto) => produto.id == id);
    produto.quantidade = produto.quantidade - quantidade > 0
        ? produto.quantidade - quantidade
        : 0;
    notifyListeners();
  }


// Edita o produto
  @action
  void editarProduto(String id, ProdutoModel novoProduto) {
    final index = produtos.indexWhere((produto) => produto.id == id);
    if (index != -1) {
      produtos[index] = novoProduto;
      notifyListeners();
    }
  }

// Pega o produto pela id
  @action
  ProdutoModel getProdutoById(String id) {
    return produtos.firstWhere((produto) => produto.id == id);
  }

//Basicamente vai pegar os outros observaveis e vai manter um valor atualizado
  @computed
  int get totalItens => produtos
      .map((produto) => produto.quantidade)
      .fold(0, (total, quantidade) => total + quantidade);
}
