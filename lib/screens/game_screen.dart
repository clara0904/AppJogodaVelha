﻿import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  static const String jogador_X = 'X';
  static const String jogador_O = 'O';

  late String jogadorAtual;
  late bool fimDeJogo;
  late List<String> localOcupado;
  String? mensagemFinal;

  @override
  void initState() {
    inicializarJogo();
    super.initState();
  }

  void inicializarJogo(){
    jogadorAtual = jogador_X;
    fimDeJogo = false;
    mensagemFinal = null;
    localOcupado = ['','','','','','','','',''];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jogo da Velha', style: TextStyle(fontSize: 27.0)),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            mensagemFinal == null ? _jogada() : _mensagemFinal(),
            _containerJogo(),
            _reiniciarJogo(),
          ],
        ),
      )
    );
  }

  Widget _jogada(){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        'Faça a sua jogada, jogador $jogadorAtual!',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _mensagemFinal() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        mensagemFinal!,
        style: const TextStyle(
          color: Colors.green,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _containerJogo(){
    return Container(
      height: MediaQuery.of(context).size.height/2,
      width: MediaQuery.of(context).size.height/2,
      margin: const EdgeInsets.all(8),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: 9, 
        itemBuilder: (context, int index){
          return _box(index);
        }
      ),
    );
  }

  Widget _box(int index){
    return InkWell(
      onTap: (){
        if(fimDeJogo || localOcupado[index].isNotEmpty){
          return;
        }

        setState(() {
          localOcupado[index] = jogadorAtual;
          trocaJogador();
          verificaVencedor();
          verificaEmpate();
        });
      },
      child: Container(
        color: localOcupado[index].isEmpty? 
        const Color.fromARGB(255, 12, 18, 87) 
        : localOcupado[index] == jogador_X
          ? const Color.fromARGB(255, 104, 16, 117) 
          : const Color.fromARGB(255, 23, 32, 134),
        
        margin: const EdgeInsets.all(8),
        child: Center(
          child: Text(
            localOcupado[index],
            style: const TextStyle(fontSize: 55, fontWeight: FontWeight.w600),
          )
        ),
      ),
    );
  }

  _reiniciarJogo(){
    return ElevatedButton(
      style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 14, 8, 146))),
      onPressed: () {
        setState(() {
          inicializarJogo();
        });
      },
      child: const Text("Reiniciar Jogo", 
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      )
    );
  }
    

  trocaJogador(){
    if(jogadorAtual == jogador_X){
      jogadorAtual = jogador_O;
    } else {
      jogadorAtual = jogador_X;
    }
  }

  verificaVencedor(){
    List<List<int>> listaVencedores = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for(var posicoes in listaVencedores){
      String posicao0 = localOcupado[posicoes[0]];
      String posicao1 = localOcupado[posicoes[1]];
      String posicao2 = localOcupado[posicoes[2]];

      if(posicao0.isNotEmpty){
        if(posicao0 == posicao1 && posicao0 == posicao2){
          vencedor("Jogador $posicao0 venceu");
        }
      }
    }
  }

  void vencedor(String mensagem){
    setState(() {
      mensagemFinal = "Fim de jogo! $mensagem"; 
      fimDeJogo = true; 
    });
  }

  verificaEmpate(){
    if(fimDeJogo){
      return;
    }
    bool empate = true;
    for(var jogadas in localOcupado){
      if(jogadas.isEmpty){
        empate = false;
      }
    }

    if(empate){
      vencedor("Empate!");
      fimDeJogo = true;
    }
  }
}