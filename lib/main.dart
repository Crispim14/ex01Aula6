import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabuadaPage(),
    );
  }
}

class TabuadaPage extends StatefulWidget {
  @override
  _TabuadaPageState createState() => _TabuadaPageState();
}

class _TabuadaPageState extends State<TabuadaPage> {
  int _x = 1;
  int _y = Random().nextInt(10);
  final _controlaSoma = TextEditingController();
  Icon _saida = Icon(Icons.question_mark);

  void _corrigir() {
    int soma = _x + _y;
    int resultado = int.tryParse(_controlaSoma.text) ?? 0;

    setState(() {
      _saida = soma == resultado ? Icon(Icons.check) : Icon(Icons.close);
      _y = Random().nextInt(10); // Gera um novo número aleatório para _y
      _controlaSoma.clear(); // Limpa o campo de texto
    });
  }

  void _trocarOperando() {
    setState(() {
      _x = Random().nextInt(10); // Gera um novo número aleatório para _x
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabuada'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$_x + $_y = '),
            TextField(
              controller: _controlaSoma,
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: _corrigir,
              child: Text('Corrigir'),
            ),
            ElevatedButton(
              onPressed: _trocarOperando,
              child: Text('Trocar Primeiro Número'),
            ),
            _saida,
          ],
        ),
      ),
    );
  }
}
