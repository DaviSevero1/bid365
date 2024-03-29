import 'package:bid365/src/home/leiloes_api/model_leiloes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/services/realm/models/task_model.dart';
import '../leiloes_api/leiloes_api.dart';

enum TaskCardStatus {
  live(Icons.adjust_sharp, 'Ao Vivo'),
  completed(Icons.pending_actions, 'Vendido'),
  scheduled(Icons.pending_actions, 'A Leiloar');

  final IconData icon;
  final String text;

  const TaskCardStatus(this.icon, this.text);
}

class TaskCard extends StatefulWidget {
  final TasBoard board;
  final ModelLeiloes leilao;

  const TaskCard({super.key, required this.board, required this.leilao});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  final getAll = Modular.get<Leilao_api>();
  double getProgress(List<TaskModel> tasks) {
    if (tasks.isEmpty) return 0;
    final completes = tasks.where((TaskModel) => TaskModel.completed).length;

    return completes / tasks.length;
  }

  String getProgressText(List<TaskModel> tasks) {
    final completes = tasks.where((TaskModel) => TaskModel.completed).length;

    return '$completes / ${tasks.length}';
  }

  TaskCardStatus getStatus(TasBoard board, double progress) {
    if (!board.enable) {
      return TaskCardStatus.completed;
    } else if (widget.leilao.is_online < 1.0) {
      return TaskCardStatus.completed;
    } else {
      return TaskCardStatus.live;
    }
  }

  Color getBackgroundColor(TaskCardStatus status, ThemeData theme) {
    switch (status) {
      case TaskCardStatus.live:
        return theme.colorScheme.outline;
      case TaskCardStatus.completed:
        return theme.colorScheme.outline;
      case TaskCardStatus.scheduled:
        return theme.colorScheme.onPrimaryContainer;
    }
  }

  Color getColor(TaskCardStatus status, ThemeData theme) {
    switch (status) {
      case TaskCardStatus.live:
        return theme.colorScheme.tertiary;
      case TaskCardStatus.completed:
        return theme.colorScheme.tertiary;
      case TaskCardStatus.scheduled:
        return theme.colorScheme.tertiary;
    }
  }

  Color iconColor(TaskCardStatus status) {
    switch (status) {
      case TaskCardStatus.live:
        return Colors.red;
      case TaskCardStatus.completed:
        return Colors.green;
      case TaskCardStatus.scheduled:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final progress = getProgress(widget.board.tasks);
    final progressText = getProgressText(widget.board.tasks);
    final title = widget.board.title;
    final status = getStatus(widget.board, progress);
    final backgroundColor = getBackgroundColor(status, theme);
    final color = getColor(status, theme);
    final iconData = status.icon;
    final iconColors = iconColor(status);
    final statuss;
    final linkUrl = widget.leilao.contents.first;

    if (widget.leilao.is_online == 1) {
      statuss = 'Ao Vivo';
    } else {
      statuss = 'A Leiloar';
    }

    return GestureDetector(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 145,
              width: 325,
              decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    )
                  ]),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 73, 72, 72)
                                .withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(3, 0),
                          )
                        ]),
                    width: 100,
                    height: 110,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        linkUrl.url,
                        fit: BoxFit.cover,
                        alignment: Alignment.centerRight,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(8, 2, 2, 2),
                            width: 200,
                            height: 120,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      statuss,
                                      style:
                                          theme.textTheme.titleSmall?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: iconColors,
                                      ),
                                    ),
                                    Icon(
                                      iconData,
                                      color: iconColors,
                                    ),
                                  ],
                                ),
                                Text(
                                  widget.leilao.auctionhouse,
                                  style: theme.textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: theme.colorScheme.onBackground,
                                  ),
                                ),
                                Text(
                                  widget.leilao.name,
                                  style: theme.textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                    color: theme.colorScheme.onBackground,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      onTap: () {
        Navigator.of(context).pushNamed('./edit', arguments: widget.leilao);
      },
    );
  }
}
