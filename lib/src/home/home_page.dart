import 'package:bid365/src/home/leiloes_api/leiloes_api.dart';
import 'package:bid365/src/home/leiloes_api/model_leiloes.dart';
import 'package:bid365/src/home/models/model_lotes.dart';
import 'package:bid365/src/home/models/lotes_api.dart';
import 'package:bid365/src/home/widgets/custom_drawer.dart';
import 'package:bid365/src/home/widgets/task_card.dart';
import 'package:bid365/src/home/widgets/view_lotes.dart';
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
                    itemBuilder: (Leilao, index) {
                      final leilaoItem = leilao[index];


                      final board = TasBoard(
                        Uuid.v4(),
                        leilaoItem.name,
  
                      );
                      return TaskCard(
                        board: board,
                        leilao: leilaoItem,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //       bottom: 100, top: 400, right: 30, left: 30),
                  //   child: ViewLotes(),
                  // ),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: FutureBuilder(
                future: Future.delayed(Duration(seconds: 3)),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return Text("Carregando...");
                },
              ),
            ),
          );
        }
      },
    );
  }
}
