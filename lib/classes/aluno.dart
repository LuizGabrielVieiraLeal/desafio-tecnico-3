import 'package:Desafio/classes/turma.dart';

class Aluno {
  final String _matricula;
  final List<Turma> _historico = [];

  Aluno(this._matricula);

  String get matricula => _matricula;

  List<Turma> get historico => _historico;

  int get cargaHoraria {
    // Cálculo da carga horaria inscritoda.
    var cargaHoraria = 0;

    for(final turma in _historico) {
      cargaHoraria += turma.cargaHoraria;
    }

    return cargaHoraria;
  }

  num get coeficientDeRendimento {
    // Cálculo do CR = Notas(i) * CargaHraria(i) / TotalCargaHoraria.
    num cr = 0;

    for(final turma in _historico) {
      final resultado = turma.nota * turma.cargaHoraria / cargaHoraria;
      cr += resultado;
    }

    return num.parse(cr.toStringAsFixed(2));
  }

  void inserirNoHistorico(String codDisciplina, String codCurso, num nota, int cargaHoraria, String anoSemestre) {
    // Método para inserir uma turma no histórico do aluno.
    final turma = Turma(codDisciplina, codCurso, nota, cargaHoraria, anoSemestre);
    _historico.add(turma);
  }

  bool inscrito(String codCurso) {
    // Métdo que verifica se oum aluno tem ligação com um curso.
    var inscrito = false;
    _historico.forEach((registro) {
      if(registro.codCurso == codCurso) {
        inscrito = true;
      }
    });
    
    return inscrito;
  }
}