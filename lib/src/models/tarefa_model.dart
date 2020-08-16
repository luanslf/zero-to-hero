class Tarefa {
  String _name;

  Tarefa.fromMap(Map<String, dynamic> map) {
    _name = map['name'];
  }

  String get name => _name;
}