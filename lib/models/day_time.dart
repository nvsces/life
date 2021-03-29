import 'package:financial_accounting/models/task_managment.dart';

class DayTime {
  List<TaskManagment> taskmanagments;
  DateTime time;
  String doc;

  DayTime(this.time, this.taskmanagments);

  Map<String, dynamic> toMap() {
    return {
      "doc": doc,
      "time": time.toString(),
      "tskm": taskmanagments.map((tskm) => tskm.toMap()).toList()
    };
  }

  DayTime.fromJson(Map<String, dynamic> data) {
    doc = data['doc'];
    time = DateTime.tryParse(data['time']);
    taskmanagments = (data['tskm'] as List)
        .map((tskm) => TaskManagment.fromJson(tskm))
        .toList();
  }
}
