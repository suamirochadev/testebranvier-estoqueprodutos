import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:testebranvier/controller/estoque_controller.dart';
import 'package:testebranvier/model/produto_model.dart';

// Aqui temos o nosso código principal, é onde vamos ter a nossa interface
// utilizando MobX como gerenciador de estados de forma reativa, ou seja,
// os widgets podem ser automaticamente reconstruidos quando os dados que eles
// estao observando mudam.

class EstoqueProdutoPage extends StatelessWidget {
  const EstoqueProdutoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<EstoqueController>(context);

    return Scaffold(
      //Titulo
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Estoque de Produtos'),
      ),
      //Corpo
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Botão de adicionar novo produto
            ElevatedButton(
              onPressed: () {
                //Informações que vão aparecer ao clicar no botão
                controller.adicionarProduto(
                  ProdutoModel(
                    id: DateTime.now().toString(),
                    nome: 'Novo Produto',
                    preco: 0.0,
                    quantidade: 0,
                  ),
                );
              },
              child: const Text(
                'Adicionar Produto',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 16),
            // Aqui utilizei o Observer - 
            // Observa os widgets envolvidos e reage conforme a ação.
            Observer(
              builder: (_) {
                int totalItens = controller.totalItens;
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Produtos no Estoque:',
                          style: TextStyle(fontSize: 18),
                        ),
                        for (var produto in controller.produtos)
                        //Ao clicar no card do produto vai mostrar a tela com detalhes do produto
                          GestureDetector(
                            onTap: () {
                              _mostrarDetalhesProduto(context, produto);
                            },
                            child: Card(
                              elevation: 2,
                              
                              child: ListTile(
                                //Aqui passo as informações como Nome, preço, quantidade no estoque
                                title: Text(
                                  '${produto.nome} - R\$${produto.preco.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                                subtitle: Text(
                                  'Quantidade: ${produto.quantidade}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.black
                                  ),
                                ),
                                tileColor: produto.temEstoque
                                    ? const Color.fromARGB(255, 213, 241, 180)
                                    : (produto.semEstoque
                                        ? const Color.fromARGB(255, 255, 158, 151)
                                        : null),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // Aqui temos algumas ações como Editar o produto,
                                    //Excluir o produto e aumentar ou diminuir a quantidade
                                    // de produtos no estoque
                                    IconButton(
                                      icon: const Icon(Icons.edit),
                                      color: Colors.black,
                                      onPressed: () {
                                        _mostrarDialogoEdicao(
                                            context, controller, produto);
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete_rounded),
                                      color: Colors.black,
                                      onPressed: () {
                                        controller.removerProduto(produto.id);
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.add),
                                      color: Colors.black,
                                      onPressed: () {
                                        controller.aumentarQuantidade(
                                            produto.id, 1);
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.remove),
                                      color: Colors.black,
                                      onPressed: () {
                                        controller.diminuirQuantidade(
                                            produto.id, 1);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // Nessa parte ele vai mostrar a quantidade total de produtos
                          // que estão no estoque
                        const SizedBox(height: 16),
                        const Divider(),
                        Text('Total de Itens em Estoque: $totalItens'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

// Aqui temos as nossas caixas de dialogo que são exibidas a cada ação: Editar ou
// ver mais detalhes do produto.
  Future<void> _mostrarDialogoEdicao(BuildContext context,
      EstoqueController controller, ProdutoModel produto) async {
    final TextEditingController nomeController = TextEditingController();
    final TextEditingController precoController = TextEditingController();
    final TextEditingController quantidadeController = TextEditingController();

    nomeController.text = produto.nome;
    precoController.text = produto.preco.toString();
    quantidadeController.text = produto.quantidade.toString();

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar Produto'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nomeController,
                decoration: const InputDecoration(labelText: 'Nome'),
              ),
              TextField(
                controller: precoController,
                decoration: const InputDecoration(labelText: 'Preço'),
              ),
              TextField(
                controller: quantidadeController,
                decoration: const InputDecoration(labelText: 'Quantidade em estoque'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                final novoProduto = ProdutoModel(
                  id: produto.id,
                  nome: nomeController.text,
                  preco: double.tryParse(precoController.text) ?? 0.0,
                  quantidade: int.tryParse(quantidadeController.text) ?? 0,
                );

                controller.editarProduto(produto.id, novoProduto);
                Navigator.of(context).pop();
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  void _mostrarDetalhesProduto(BuildContext context, ProdutoModel produto) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Detalhes do Produto'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nome: ${produto.nome}'),
              Text('Preço: R\$${produto.preco.toStringAsFixed(2)}'),
              Text('Quantidade disponível em estoque: ${produto.quantidade}'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }
}
