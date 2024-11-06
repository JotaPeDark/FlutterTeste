import 'package:flutter/material.dart';
import '../models/atividade_mental.dart';

class AtividadeListWidget extends StatelessWidget {
  final List<AtividadeMental> atividades;

  const AtividadeListWidget({Key? key, required this.atividades}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: atividades.length,
      itemBuilder: (context, index) {
        final atividade = atividades[index];
        return ListTile(
          title: Text(atividade.nome),
          subtitle: Text(atividade.descricao),
          trailing: Text('Bem-Estar: ${atividade.nivelDeBemEstar}'),
        );
      },
    );
  }
}
