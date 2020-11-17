class Turma {
  final String _codDisciplina;
  final String _codCurso;
  final num _nota;
  final int _cargaHoraria;
  final String _anoSemestre;

  Turma(this._codDisciplina, this._codCurso, this._nota, this._cargaHoraria, this._anoSemestre);

  String get codDisciplina => _codDisciplina;

  String get codCurso => _codCurso;

  num get nota => _nota;

  int get cargaHoraria => _cargaHoraria;

  String get anoSemestre => _anoSemestre;
}