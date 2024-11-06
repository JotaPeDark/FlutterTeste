import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/models/atividade_mental.dart';

void main() {
  test('Caso de Uso: Deve criar uma instância de AtividadeMental a partir de JSON', () {
    final json = {
      "id": 1,
      "nome": "Meditação",
      "descricao": "Prática de meditação",
      "nivelDeBemEstar": 5
    };

    final atividade = AtividadeMental.fromJson(json);

    expect(atividade.id, 1);
    expect(atividade.nome, "Meditação");
    expect(atividade.descricao, "Prática de meditação");
    expect(atividade.nivelDeBemEstar, 5);

    print('Caso de Uso: Instância de AtividadeMental criada corretamente a partir do JSON.');
  });


  test('Caso de Uso: Deve calcular a média de bem-estar das atividades', () {
    final atividades = [
      AtividadeMental(id: 1, nome: 'Meditação', descricao: 'Prática diária', nivelDeBemEstar: 5),
      AtividadeMental(id: 2, nome: 'Respiração', descricao: 'Controle de respiração', nivelDeBemEstar: 3),
    ];

    final nivelMedio = atividades.map((a) => a.nivelDeBemEstar).reduce((a, b) => a + b) / atividades.length;

    expect(nivelMedio, 4);

    print('Caso de Uso: Nível médio de bem-estar calculado corretamente.');
  });

}