import 'package:financial_accounting/models/day_time.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'chart_model.dart';

List<charts.Color> barColors = [
  charts.ColorUtil.fromDartColor(Colors.red),
  charts.ColorUtil.fromDartColor(Colors.blue),
  charts.ColorUtil.fromDartColor(Colors.green),
  charts.ColorUtil.fromDartColor(Colors.yellow),
  charts.ColorUtil.fromDartColor(Colors.pink),
  charts.ColorUtil.fromDartColor(Colors.teal),
  charts.ColorUtil.fromDartColor(Colors.deepOrange),
  charts.ColorUtil.fromDartColor(Colors.amber),
  charts.ColorUtil.fromDartColor(Colors.cyan),
  charts.ColorUtil.fromDartColor(Colors.red),
  charts.ColorUtil.fromDartColor(Colors.blue),
  charts.ColorUtil.fromDartColor(Colors.green),
  charts.ColorUtil.fromDartColor(Colors.yellow),
  charts.ColorUtil.fromDartColor(Colors.pink),
  charts.ColorUtil.fromDartColor(Colors.teal),
  charts.ColorUtil.fromDartColor(Colors.deepOrange),
  charts.ColorUtil.fromDartColor(Colors.amber),
  charts.ColorUtil.fromDartColor(Colors.cyan),
  charts.ColorUtil.fromDartColor(Colors.red),
  charts.ColorUtil.fromDartColor(Colors.blue),
  charts.ColorUtil.fromDartColor(Colors.green),
  charts.ColorUtil.fromDartColor(Colors.yellow),
  charts.ColorUtil.fromDartColor(Colors.pink),
  charts.ColorUtil.fromDartColor(Colors.teal),
  charts.ColorUtil.fromDartColor(Colors.deepOrange),
  charts.ColorUtil.fromDartColor(Colors.amber),
  charts.ColorUtil.fromDartColor(Colors.cyan),
  charts.ColorUtil.fromDartColor(Colors.red),
  charts.ColorUtil.fromDartColor(Colors.blue),
  charts.ColorUtil.fromDartColor(Colors.green),
  charts.ColorUtil.fromDartColor(Colors.yellow),
  charts.ColorUtil.fromDartColor(Colors.pink),
  charts.ColorUtil.fromDartColor(Colors.teal),
  charts.ColorUtil.fromDartColor(Colors.deepOrange),
  charts.ColorUtil.fromDartColor(Colors.amber),
  charts.ColorUtil.fromDartColor(Colors.cyan),
  charts.ColorUtil.fromDartColor(Colors.red),
  charts.ColorUtil.fromDartColor(Colors.blue),
  charts.ColorUtil.fromDartColor(Colors.green),
  charts.ColorUtil.fromDartColor(Colors.yellow),
  charts.ColorUtil.fromDartColor(Colors.pink),
  charts.ColorUtil.fromDartColor(Colors.teal),
  charts.ColorUtil.fromDartColor(Colors.deepOrange),
  charts.ColorUtil.fromDartColor(Colors.amber),
  charts.ColorUtil.fromDartColor(Colors.cyan),
  charts.ColorUtil.fromDartColor(Colors.red),
  charts.ColorUtil.fromDartColor(Colors.blue),
  charts.ColorUtil.fromDartColor(Colors.green),
  charts.ColorUtil.fromDartColor(Colors.yellow),
  charts.ColorUtil.fromDartColor(Colors.pink),
  charts.ColorUtil.fromDartColor(Colors.teal),
  charts.ColorUtil.fromDartColor(Colors.deepOrange),
  charts.ColorUtil.fromDartColor(Colors.amber),
  charts.ColorUtil.fromDartColor(Colors.cyan),
  charts.ColorUtil.fromDartColor(Colors.red),
  charts.ColorUtil.fromDartColor(Colors.blue),
  charts.ColorUtil.fromDartColor(Colors.green),
  charts.ColorUtil.fromDartColor(Colors.yellow),
  charts.ColorUtil.fromDartColor(Colors.pink),
  charts.ColorUtil.fromDartColor(Colors.teal),
  charts.ColorUtil.fromDartColor(Colors.deepOrange),
  charts.ColorUtil.fromDartColor(Colors.amber),
  charts.ColorUtil.fromDartColor(Colors.cyan),
  charts.ColorUtil.fromDartColor(Colors.red),
  charts.ColorUtil.fromDartColor(Colors.blue),
  charts.ColorUtil.fromDartColor(Colors.green),
  charts.ColorUtil.fromDartColor(Colors.yellow),
  charts.ColorUtil.fromDartColor(Colors.pink),
  charts.ColorUtil.fromDartColor(Colors.teal),
  charts.ColorUtil.fromDartColor(Colors.deepOrange),
  charts.ColorUtil.fromDartColor(Colors.amber),
  charts.ColorUtil.fromDartColor(Colors.cyan),
];

class StatisticsModel {
  String nameCategory;
  List<DayTime> days;

  List<Duration> durations;
  List<DateTime> durTimes;
  List<ChartMode> data;
  bool show = false;

  //StatisticsModel(this.nameCategory, this.days, this.durations);

  StatisticsModel.create(List<DayTime> timeDays, String name) {
    List<Duration> createDurations = [];
    List<DateTime> createDurTimes = [];
    List<ChartMode> createData = [];
    days = timeDays;
    nameCategory = name;
    for (int i = 0; i < timeDays.length; i++) {
      for (int j = 0; j < timeDays[i].taskmanagments.length; j++) {
        if (timeDays[i].taskmanagments[j].name == name) {
          createDurTimes.add(timeDays[i].time);
          var duration = timeDays[i].taskmanagments[j].duration;
          createDurations.add(duration);
          var chName = timeDays[i].time.day.toString() +
              '.' +
              timeDays[i].time.month.toString();
          ChartMode mode = ChartMode(chName, duration, barColors[j]);
          createData.add(mode);
        }
      }
    }
    durations = createDurations;
    durTimes = createDurTimes;
    data = createData;
  }
}
