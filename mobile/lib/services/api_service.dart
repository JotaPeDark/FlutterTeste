import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/atividade_mental.dart';

class ApiService {
  final http.Client client;

  ApiService({required this.client});

  Future<List<AtividadeMental>> fetchAtividadesMentais() async {
    final response = await client.get(Uri.parse('http://localhost:3000/atividades'));

    if (response.statusCode == 200) {
      final List<dynamic> atividadesJson = json.decode(response.body);
      return atividadesJson.map((json) => AtividadeMental.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao buscar atividades mentais');
    }
  }
}