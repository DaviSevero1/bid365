import 'package:bid365/src/home/leiloes_api/leiloes_api.dart';
import 'package:bid365/src/home/leiloes_api/model_leiloes.dart';
import 'package:bid365/src/home/widgets/custom_drawer.dart';
import 'package:bid365/src/home/widgets/task_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:realm/realm.dart';

import '../shared/services/realm/models/task_model.dart';
import '../shared/widgets/user_image_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final getAll = Modular.get<Leilao_api>();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ModelLeiloes>>(
      future: getAll.getAll(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final leilao = snapshot.data!;

          return Scaffold(
            drawer: const CustomDrawer(),
            appBar: AppBar(
              title: const Text('Leilão Bid365'),
              actions: const [
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: UserImageButton(),
                ),
              ],
            ),
            body: Center(
              child: Stack(
                children: [
                  ListView.separated(
                    padding: const EdgeInsets.only(
                      top: 70,
                      left: 30,
                      right: 30,
                      bottom: 200,
                    ),
                    itemCount: leilao.length,
                    itemBuilder: (_, index) {
                      final board = TasBoard(
                        Uuid.v4(),
                        'Raça Nelore',
                        tasks: [
                          TaskModel(Uuid.v4(), '', completed: true),
                          TaskModel(Uuid.v4(), '', completed: true),
                          TaskModel(Uuid.v4(), '', completed: true),
                          TaskModel(Uuid.v4(), '', completed: true),
                        ],
                      );
                      return TaskCard(
                        board: board,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SegmentedButton<int>(
                        segments: const [
                          ButtonSegment(
                            value: 0,
                            label: Text('A leiloar'),
                          ),
                          ButtonSegment(
                            value: 1,
                            label: Text('Ao Vivo'),
                          ),
                          ButtonSegment(
                            value: 2,
                            label: Text('Vendidos'),
                          ),
                        ],
                        selected: const {1},
                        onSelectionChanged: (values) {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container(
            child: Text('Erro ao carregar leilões'),
          );
        }
      },
    );
  }
}
