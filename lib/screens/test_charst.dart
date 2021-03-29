import 'package:financial_accounting/models/chart_model.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class TestCgarts extends StatelessWidget {
  TestCgarts(this.data, {Key key}) : super(key: key);

  List<ChartMode> data;
  // = [
  //   ChartMode('Сегодня', Duration(days: 2),
  //       charts.ColorUtil.fromDartColor(Colors.blue)),
  //   ChartMode(
  //       'Вчера', Duration(days: 1), charts.ColorUtil.fromDartColor(Colors.red)),
  //   ChartMode('Завтра', Duration(days: 2, hours: 3),
  //       charts.ColorUtil.fromDartColor(Colors.yellow)),
  //   ChartMode('Четверг', Duration(hours: 8),
  //       charts.ColorUtil.fromDartColor(Colors.green)),
  // ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<ChartMode, String>> series = [
      charts.Series(
          id: "Subscribers",
          data: data,
          domainFn: (ChartMode series, _) => series.name,
          measureFn: (ChartMode series, _) => series.value.inSeconds,
          colorFn: (ChartMode series, _) => series.barColor)
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Expanded(
            child: charts.BarChart(series, animate: true),
          ),
        ),
      ),
    );
  }
}
