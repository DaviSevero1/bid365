import 'package:bid365/src/home/lotes_api/model_lotes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../lotes_api/lotes_api.dart';

class ViewLotes extends StatefulWidget {
  const ViewLotes({Key? key}) : super(key: key);

  @override
  State<ViewLotes> createState() => _ViewLotesState();
}

class _ViewLotesState extends State<ViewLotes> {
  final getLotes = Modular.get<Lotes_api>();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ModelLotes>>(
        future: getLotes.getAllLotes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final lote = snapshot.data!;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: lote.length,
              itemBuilder: (BuildContext context, int index) {
                final loteItem = lote[index];
                final imagemId = lote[index].images[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('./edit');
                  },
                  child: Card(
                    child: Container(
                      width: 140,
                      height: 170,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          imagemId.url,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Text('Falha ao buscar lotes');
          }
        });
  }
}
