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
    final linkUrl = widget.leilao.contents.first;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        //Image.asset('assets/'),
        title: Image.asset(
          'assets/icone.png',
          width: 150,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 240,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                linkUrl.url,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(25),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                widget.leilao.name,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  color: theme.colorScheme.onBackground,
                ),
              ),
            ),
          ),
          Container(
            //padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.date_range_rounded),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text('Data Leilão'),
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            alignment: AlignmentDirectional.bottomCenter,
                            padding: EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 80, 133, 12),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(100),
                                  bottomRight: Radius.circular(15),
                                  bottomLeft: Radius.circular(15)),
                            ),
                            child: Text(widget.leilao.date),
                            width: 130,
                            height: 60,
                          ),
                        ],
                      ),
                    ),
                    //const SizedBox(
                    //width: 30,
                    //),
                    Container(
                      width: 130,
                      height: 130,
                      alignment: AlignmentDirectional.bottomCenter,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: theme.colorScheme.outline,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.access_time),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text('Horário'),
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            alignment: AlignmentDirectional.bottomCenter,
                            padding: EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 80, 133, 12),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(100),
                                  bottomRight: Radius.circular(15),
                                  bottomLeft: Radius.circular(15)),
                            ),
                            child: Text(widget.leilao.time),
                            width: 130,
                            height: 60,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.location_on),
                                const SizedBox(
                                  width: 3,
                                ),
                                Text('Localização'),
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            alignment: AlignmentDirectional.bottomCenter,
                            padding: EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 80, 133, 12),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(100),
                                  bottomRight: Radius.circular(15),
                                  bottomLeft: Radius.circular(15)),
                            ),
                            child: Text(widget.leilao.city),
                            width: 130,
                            height: 60,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 130,
                      height: 130,
                      alignment: AlignmentDirectional.bottomCenter,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: theme.colorScheme.outline,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.phone),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text('Contato'),
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            alignment: AlignmentDirectional.bottomCenter,
                            padding: EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 80, 133, 12),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(100),
                                  bottomRight: Radius.circular(15),
                                  bottomLeft: Radius.circular(15)),
                            ),
                            child: Text(widget.leilao.phone),
                            width: 130,
                            height: 60,
                          ),
                        ],
                      ),
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
