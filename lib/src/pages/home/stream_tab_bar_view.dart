import 'package:flutter/material.dart';
import 'package:zero_to_hero/src/controllers/home_controller.dart';
import 'package:zero_to_hero/src/models/tarefa_model.dart';

class StreamTabBarView extends StatelessWidget {
  
  List<Tarefa> tarefas;
  final homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<List<Tarefa>>(
        stream: homeController.streamTarefas(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Ocorreu um erro inesperado');
          } else if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          tarefas = snapshot.data;

          return ListView.builder(
            itemCount: tarefas.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(tarefas[index].name),
              );
            },
          );
        },
      ),
    );
  }
}
