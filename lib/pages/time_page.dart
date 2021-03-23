import 'dart:async';

import 'package:financial_accounting/models/task_managment.dart';
import 'package:financial_accounting/services/finantical_provider.dart';
import 'package:flutter/material.dart';

class TimePage extends StatefulWidget {
  TimePage({Key key}) : super(key: key);

  @override
  _TimePageState createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  final FinanticalProvider _finanticalProvider = FinanticalProvider();
  List<String> nameTask = [
    'Работа',
    'Универ',
    'Учёба',
    'Социальная сфера',
    'Чтение книги',
    'Просмотр филма',
    'Диплом'
  ];
  List<TaskManagment> timeList = [];
  //Duration duration = Duration();

  _setTimeInit(int i) async {
    TaskManagment taskm =
        TaskManagment(nameTask[i], DateTime.now(), false, Duration());
    await _finanticalProvider.setTime(taskm);
  }

  resetTime() {
    for (int i = 0; i < timeList.length; i++) {
      var dururation = timeList[i].currentDuration;
      var tasktime =
          TaskManagment(timeList[i].name, DateTime.now(), false, dururation);
      _finanticalProvider.setTime(tasktime);
    }
  }

  _setTime(int i) async {
    resetTime();

    TaskManagment task;
    Duration duration;
    duration = timeList[i].currentDuration;

    if (!timeList[i].istime) {
      task = TaskManagment(timeList[i].name, DateTime.now(), true, duration);
    } else {
      task = TaskManagment(timeList[i].name, DateTime.now(), false, duration);
    }

    await _finanticalProvider.setTime(task);
  }

  loadTimes() async {
    var stream = _finanticalProvider.getTimes();
    stream.listen((times) {
      setState(() {
        timeList = times;
      });
    });
  }

  void initTaskManagment() {
    for (int i = 0; i < nameTask.length; i++) {
      timeList
          .add(TaskManagment(nameTask[i], DateTime.now(), false, Duration()));
    }
  }

  @override
  void initState() {
    initTaskManagment();
    loadTimes();
    Timer.periodic(Duration(seconds: 1), (timer) {
      for (int i = 0; i < timeList.length; i++) {
        if (timeList[i].istime) {
          //timeList[i].time =
          timeList[i].currentDuration =
              DateTime.now().difference(timeList[i].time) +
                  timeList[i].duration;
        }
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            itemCount: timeList.length,
            itemBuilder: (context, i) {
              return ListTile(
                onTap: () {
                  _setTime(i);
                },
                title: Text(timeList[i].name),
                subtitle:
                    !timeList[i].istime ? Text('') : Text(timeList[i].name),
                trailing: timeList[i].currentDuration != null
                    ? Text(timeList[i].currentDuration.toString().split('.')[0])
                    : Text(''),
              );
            }));
    // child: ListView.builder(
    //     itemCount: nameTask.length,
    //     itemBuilder: (context, i) {
    //       return ListTile(
    //         onTap: () {
    //           _setTimeInit(i);
    //         },
    //         title: Text(nameTask[i]),
    //       );
    //     }));
  }
}
