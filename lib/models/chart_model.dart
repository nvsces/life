import 'package:charts_flutter/flutter.dart' as charts;

class ChartMode {
  String name;
  Duration value;
  charts.Color barColor;

  double toDouble() {
    return value.inDays * 24 +
        value.inHours +
        value.inMinutes / 60 +
        value.inSeconds / 3600;
  }

  ChartMode(this.name, this.value, this.barColor);
}
