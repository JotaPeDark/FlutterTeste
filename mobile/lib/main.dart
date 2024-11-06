import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/atividade_mental.dart';
import 'services/api_service.dart';
import 'widgets/atividade_list_widget.dart';

void main() {
  runApp(GuiaMentalApp());
}

class GuiaMentalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guia Mental',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AtividadesPage(),
    );
  }
}

class AtividadesPage extends StatefulWidget {
  @override
  _AtividadesPageState createState() => _AtividadesPageState();
}

class _AtividadesPageState extends State<AtividadesPage> {
  final ApiService apiService = ApiService(client: http.Client());
  late Future<List<AtividadeMental>> futureAtividades;

  @override
  void initState() {
    super.initState();
    futureAtividades = apiService.fetchAtividadesMentais();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Guia Mental')),
      body: FutureBuilder<List<AtividadeMental>>(
        future: futureAtividades,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhuma atividade encontrada'));
          } else {
            return AtividadeListWidget(atividades: snapshot.data!);
          }
        },
      ),
    );
  }
}