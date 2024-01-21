import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testebranvier/controller/estoque_controller.dart';
import 'package:testebranvier/screen/estoque_produto_page.dart';

// Arquivo onde colocamos o nosso widget build de inicio contendo o theme data,
// o nosso provider, nome do aplicativo, ativação do material.

class EstoqueDeProdutosApp extends StatelessWidget {
  const EstoqueDeProdutosApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste Branvier by Suami Rocha',
      theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.orange, 
      background: Colors.amber.shade100, 
      error: Colors.red, 
      onTertiary: Colors.teal,
      ),
      ),
      debugShowCheckedModeBanner: false,

      // Aqui especificamos para o provider qual instância queremos que ele
      // gerencie (Injeção de Dependência) 
      home: ChangeNotifierProvider<EstoqueController>(
        create: (_) => EstoqueController(),
        child: const EstoqueProdutoPage(),
      ),
    );
  }
}
