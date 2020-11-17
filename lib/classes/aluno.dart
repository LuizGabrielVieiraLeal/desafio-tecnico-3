import 'package:Desafio/classes/turma.dart';

class Aluno {
  final String _matricula;
  final List<Turma> _historico = [];

  Aluno(this._matricula);

  void inserirNoHistorico(String codDisciplina, String codCurso, num nota, int cargaHoraria, String anoSemestre) {
    final turma = Turma(codDisciplina, codCurso, nota, cargaHoraria, anoSemestre);
    _historico.add(turma);
  }

  String get matricula => _matricula;

  List<Turma> get historico => _historico;

  int get cargaHorariaCursada {
    var cargaHoraria = 0;

    for(final turma in _historico) {
      cargaHoraria += turma.cargaHoraria;
    }

    return cargaHoraria;
  }

  num get coeficientDeRendimento {
    num cr = 0;

    for(final turma in _historico) {
      final resultado = turma.nota * turma.cargaHoraria / cargaHorariaCursada;
      cr += resultado;
    }

    return num.parse(cr.toStringAsFixed(2));
  }

  bool cursa(String codCurso) {
    var cursa = false;
    _historico.forEach((registro) {
      if(registro.codCurso == codCurso) {
        cursa = true;
      }
    });
    
    return cursa;
  }
}