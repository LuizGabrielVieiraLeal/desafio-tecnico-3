import 'package:Desafio/classes/disciplina.dart';

class Curso {
  final String _codCurso;
  final List<Disciplina> _disciplinas = [];

  Curso(this._codCurso);

  String get codCurso => _codCurso;

  List<Disciplina> get disciplinas => _disciplinas;

  int get cargaHoraria {
    var cargaHoraria = 0;

    _disciplinas.forEach((disciplina) {
      cargaHoraria += disciplina.cargaHoraria;
    });

    return cargaHoraria;
  }

  bool possuiDisciplina(String codDisciplina) {
    var possui = false;

    for(final disciplina in _disciplinas) {
      if(disciplina.codDisciplina == codDisciplina) {
        possui = true;
      }
    }

    return possui;
  }

  void inserirDisciplina(String codDisciplina, int cargaHoraria) {
    final disciplina = Disciplina(codDisciplina, cargaHoraria);
    _disciplinas.add(disciplina);
  }

  int cargaHorariaDaDisciplina(String codDisciplina) {
    var carga = 0;

    _disciplinas.forEach((disciplina) {
      if(disciplina.codDisciplina == codDisciplina) {
        carga = disciplina.cargaHoraria;
      }
    });

    return carga;
  }
}