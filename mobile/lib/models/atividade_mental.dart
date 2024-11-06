class AtividadeMental {
  final int id;
  final String nome;
  final String descricao;
  final int nivelDeBemEstar;

  AtividadeMental({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.nivelDeBemEstar,
  });

  // Método para converter JSON em uma instância de AtividadeMental
  factory AtividadeMental.fromJson(Map<String, dynamic> json) {
    return AtividadeMental(
      id: json['id'],
      nome: json['nome'],
      descricao: json['descricao'],
      nivelDeBemEstar: json['nivelDeBemEstar'],
    );
  }
}
