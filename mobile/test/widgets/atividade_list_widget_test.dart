import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:mobile/widgets/atividade_list_widget.dart';
import 'package:mobile/models/atividade_mental.dart';

void main() {
  testWidgets('Teste de Widget: Deve exibir uma lista de atividades mentais', (WidgetTester tester) async {
    final atividades = [
      AtividadeMental(id: 1, nome: 'Meditação', descricao: 'Prática diária', nivelDeBemEstar: 5),
      AtividadeMental(id: 2, nome: 'Respiração', descricao: 'Controle de respiração', nivelDeBemEstar: 4),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AtividadeListWidget(atividades: atividades),
        ),
      ),
    );

    expect(find.text('Meditação'), findsOneWidget);
    expect(find.text('Respiração'), findsOneWidget);

    print('Teste de Widget: Lista de atividades mentais exibida corretamente.');
  });
}
