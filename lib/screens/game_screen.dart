import 'package:flutter/material.dart';
import 'package:jogo_da_velha/components/botao_reiniciar.dart';
import 'package:jogo_da_velha/components/botao_resultado.dart';
import 'package:jogo_da_velha/components/container_jogo.dart';
import 'package:jogo_da_velha/components/jogada.dart';
import 'package:jogo_da_velha/components/mensagem_final.dart';
import 'package:jogo_da_velha/database/app_database.dart';
import 'package:jogo_da_velha/screens/result_screen.dart';
import 'package:drift/drift.dart' as drift;

class GameScreen extends StatefulWidget {
  final AppDatabase database;
  const GameScreen({super.key, required this.database});

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
  late String jogadorVencedor;

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
            mensagemFinal == null ? Jogada(jogadorAtual: jogadorAtual) : MensagemFinal(mensagemFinal: mensagemFinal!,),
            ContainerJogo(box: _box),
            BotaoReiniciar(
              onPressed: () {
                setState(() {
                  inicializarJogo();
                });
              },
            ),
            BotaoResultado(onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: 
                  (context){
                    return ResultScreen(database: widget.database);
                  }
                )
              );
            })
          ],
        ),
      )
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
        if (posicao0 == posicao1 && posicao0 == posicao2) {
          jogadorVencedor = posicao0;
          vencedor("Jogador $posicao0 venceu");
          _salvarVencedor('$jogadorVencedor venceu'); 
          return;
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
      _salvarVencedor(jogadorVencedor);
    }
    jogadorVencedor = 'Empate';

  }

  void _salvarVencedor(String jogadorVencedor) {
    final game = GameResultsCompanion(
      vencedor: drift.Value(jogadorVencedor),
      date: drift.Value(DateTime.now()),
    );
    widget.database.addGame(game);
  }
}