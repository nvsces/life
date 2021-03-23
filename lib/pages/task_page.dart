import 'package:financial_accounting/models/task_model.dart';
import 'package:financial_accounting/services/finantical_provider.dart';
import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  TaskPage({Key key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final FinanticalProvider _finanticalProvider = FinanticalProvider();

  String text = 'Пусто';
  String subtext = '';
  List<String> nameRask = ['Работа', 'Универ', 'Учёба', 'Социальная сфера'];
  //TaskModel model_task;

  loadTask() async {
    var stream = _finanticalProvider.getTasks();
    stream.listen((tasks) {
      tasks.sort((a, b) => a.time.compareTo(b.time));
      setState(() {
        text = tasks.last.name;
        subtext = tasks.last.time.toString();
      });
    });
  }

  void setTaskName(int i) async {
    _finanticalProvider.setTask(TaskModel(nameRask[i], DateTime.now()));
  }

  // loadData() async {
  //   var a = await _finanticalProvider.getTaskSnapshot();
  //   setState(() {
  //     TaskModel task = TaskModel.fromJson(a.docs.first.data());
  //     text = task.name;
  //     //subtext = task.time;
  //   });
  // }

  @override
  void initState() {
    loadTask();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text('Фокус на сегодня :$text'),
        Expanded(
          child: ListView.builder(
            itemCount: nameRask.length,
            itemBuilder: (context, i) {
              return ListTile(
                onTap: () {
                  setTaskName(i);
                },
                title: Text(nameRask[i]),
              );
            },
          ),
        ),
      ],
    ));
  }
}
