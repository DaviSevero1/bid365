import 'package:flutter/material.dart';

import '../../shared/services/realm/models/task_model.dart';

enum TaskCardStatus {
  pending(Icons.adjust_sharp, 'Ao Vivo'),
  completed(Icons.check, 'Vendido'),
  disabled(Icons.pending_actions, 'A Leiloar');

  final IconData icon;
  final String text;

  const TaskCardStatus(this.icon, this.text);
}

class TaskCard extends StatelessWidget {
  final TasBoard board;

  const TaskCard({super.key, required this.board});

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
      return TaskCardStatus.disabled;
    } else if (progress < 1.0) {
      return TaskCardStatus.pending;
    } else {
      return TaskCardStatus.completed;
    }
  }

  Color getBackgroundColor(TaskCardStatus status, ThemeData theme) {
    switch (status) {
      case TaskCardStatus.pending:
        return theme.colorScheme.shadow;
      case TaskCardStatus.completed:
        return theme.colorScheme.outline;
      case TaskCardStatus.disabled:
        return theme.colorScheme.onPrimaryContainer;
    }
  }

  Color getColor(TaskCardStatus status, ThemeData theme) {
    switch (status) {
      case TaskCardStatus.pending:
        return theme.colorScheme.tertiary;
      case TaskCardStatus.completed:
        return theme.colorScheme.tertiary;
      case TaskCardStatus.disabled:
        return theme.colorScheme.error;
    }
  }

  Color iconColor(TaskCardStatus status) {
    switch (status) {
      case TaskCardStatus.pending:
        return Colors.red;
      case TaskCardStatus.completed:
        return Colors.green;
      case TaskCardStatus.disabled:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final progress = getProgress(board.tasks);
    final progressText = getProgressText(board.tasks);
    final title = board.title;
    final status = getStatus(board, progress);
    final statusText = status.text;
    final backgroundColor = getBackgroundColor(status, theme);
    final color = getColor(status, theme);
    final iconData = status.icon;
    final iconColors = iconColor(status);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('./edit');
      },
      child: Stack(children: [
        Align(
          alignment: Alignment.centerRight,
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
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Color.fromARGB(255, 73, 72, 72).withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(3, 0),
                        )
                      ]),
                  width: 100,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/vaca.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 2, 4, 2),
                  width: 205,
                  height: 120,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            iconData,
                            color: iconColors,
                          ),
                          const Spacer(),
                          Text(
                            statusText,
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: iconColors,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        title,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: theme.colorScheme.onBackground,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      if (board.tasks.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            LinearProgressIndicator(
                              value: progress,
                              color: color,
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              progressText,
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: theme.textTheme.bodySmall?.color
                                    ?.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
