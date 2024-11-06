import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mobile/services/api_service.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late ApiService apiService;
  late MockHttpClient mockClient;

  setUp(() {
    mockClient = MockHttpClient();
    apiService = ApiService(client: mockClient);
  });

  test('Teste HTTP com Mock: Deve filtrar atividades com nível de bem-estar acima de 4', () async {
    when(() => mockClient.get(Uri.parse('http://localhost:3000/atividades')))
        .thenAnswer((_) async => http.Response(json.encode([
              {"id": 1, "nome": "Meditação", "descricao": "Prática diária", "nivelDeBemEstar": 5},
              {"id": 2, "nome": "Respiração", "descricao": "Controle de respiração", "nivelDeBemEstar": 3}
            ]), 200));

    final atividades = await apiService.fetchAtividadesMentais();
    final atividadesFiltradas = atividades.where((a) => a.nivelDeBemEstar > 4).toList();

    expect(atividadesFiltradas.length, 1);
    expect(atividadesFiltradas[0].nome, "Meditação");

    print('Teste HTTP com Mock: Atividades com nível de bem-estar > 4 filtradas corretamente.');
  });
}
