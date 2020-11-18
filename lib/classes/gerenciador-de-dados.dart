import 'dart:io';
import 'package:Desafio/classes/aluno.dart';

class GerenciadorDeDados {
  final String _caminhoDoArquivo;
  final List<Aluno> _alunos = [];
  final List<String> _listaDecursos = [];

  GerenciadorDeDados.carregarCSV(this._caminhoDoArquivo) {
    try {
      final linhas = File(_caminhoDoArquivo).readAsStringSync().split('\n');
      
      // Removendo linhas desnecessárias.
      linhas.removeAt(0);
      linhas.removeAt(linhas.length - 1);

      final mapa = _mapearCSV(linhas);
      
      _gerarDados(mapa);

    } catch(e) {
      print('Erro ao carregar arquivo CSV.\nErro: ${e.toString()}');
    }
  }

  List _mapearCSV(List<String> linhas){
    // Método para converter as strings do arquivo em mapas.
    final dados = [];

    for(final linha in linhas) {
      final dado = {};
      
      dado['matricula'] = linha.split(',')[0];
      dado['codDisciplina'] = linha.split(',')[1];
      dado['codCurso'] = linha.split(',')[2];
      dado['nota'] = num.parse(linha.split(',')[3]);
      dado['cargaHoraria'] = int.parse(linha.split(',')[4]);
      dado['anoSemestre'] = linha.split(',')[5];

      dados.add(dado);
    }

    dados.removeAt(0);
    dados.removeAt(dados.length - 1);

    return dados;
  }

  void _gerarDados(List dados) {
    // Método que cria os alun os e preenche a lista de cursos.
    final alunosCriados = [];

    for(final dado in dados) {
      if(!_listaDecursos.contains(dado['codCurso'])) {
        _listaDecursos.add(dado['codCurso']);
      }

      if(!alunosCriados.contains(dado['matricula'])) {
        final novoAluno = Aluno(dado['matricula']);

        novoAluno.inserirNoHistorico(dado['codDisciplina'], dado['codCurso'], dado['nota'],  dado['cargaHoraria'], dado['anoSemestre']);

        _alunos.add(novoAluno);
        alunosCriados.add(dado['matricula']);
      } else {
        for(final aluno in _alunos) {
          if(aluno.matricula == dado['matricula']) {
            aluno.inserirNoHistorico(dado['codDisciplina'], dado['codCurso'], dado['nota'],  dado['cargaHoraria'], dado['anoSemestre']);
          }
        }
      }
    }
  }

  void mostrarCRDosAlunos() {
    // Método que imprime CR dos alunos.
    print('------- O CR dos alunos é: --------');

    for(final aluno in _alunos) {
      print('Matricula: ${aluno.matricula} - CR: ${aluno.coeficientDeRendimento}');
    }

    print('-----------------------------------');
  }

  void mostrarMediaDeCRDosCursos() {
    // Método que imprime a média CR dos alunos de cada curso.
    print('----- Média de CR dos cursos ------');

    _listaDecursos.forEach((curso) {
      var somatorioDasNotas = 0.0;
      var numeroDeAlunos = 0;

      _alunos.forEach((aluno) {
        if(aluno.inscrito(curso)) {
          somatorioDasNotas += aluno.coeficientDeRendimento;
          numeroDeAlunos++;
        }
      });

      var crCurso = somatorioDasNotas / numeroDeAlunos;

      print('Curso: ${curso} - Média de CR: ${crCurso.toStringAsFixed(2)}');
    });

    print('-----------------------------------');
  }
}