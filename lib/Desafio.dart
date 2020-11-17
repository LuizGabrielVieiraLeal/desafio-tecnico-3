import 'package:Desafio/classes/gerenciador-de-dados.dart';

void run() {
  final gerenciadorDeDados = GerenciadorDeDados.carregarCSV('notas.csv');
  
  gerenciadorDeDados.mostrarCRDosAlunos();
  gerenciadorDeDados.mostrarMediaDeCRDosCursos();
}
