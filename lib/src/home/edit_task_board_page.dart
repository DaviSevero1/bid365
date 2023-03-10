import 'package:bid365/src/home/leiloes_api/model_leiloes.dart';
import 'package:flutter/material.dart';

class EditTaskBoardPage extends StatefulWidget {
  final ModelLeiloes leilao;
  const EditTaskBoardPage({Key? key, required this.leilao}) : super(key: key);

  @override
  State<EditTaskBoardPage> createState() => _EditTaskBoardPageState();
}

class _EditTaskBoardPageState extends State<EditTaskBoardPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final Leilao_api leilao =
    //     ModalRoute.of(context)!.settings.arguments as Leilao_api;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.leilao.city), //Pera ae
      ),
      body: Column(
        children: [
          Container(
            height: 240,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/vaca.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(25),
            //color: Colors.amber,
            child: Row(
              children: [
                Text(
                  'Nelore',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: theme.colorScheme.secondary,
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            alignment: Alignment.center,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: theme.colorScheme.outline,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                            ),
                          ]),
                      width: 130,
                      height: 130,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Data', style: TextStyle(fontSize: 17)),
                            Spacer(),
                            Icon(Icons.date_range_rounded),
                            Spacer(),
                            Text(
                              widget.leilao.date,
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Container(
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: theme.colorScheme.outline,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                            )
                          ]),
                      width: 130,
                      height: 130,
                      child: Text(widget.leilao.time),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Container(
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: theme.colorScheme.outline,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                            )
                          ]),
                      width: 130,
                      height: 130,
                      child: Text(widget.leilao.city),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Container(
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: theme.colorScheme.outline,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                            )
                          ]),
                      width: 130,
                      height: 130,
                      child: Text(widget.leilao.phone),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
