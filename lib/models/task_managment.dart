class TaskManagment {
  String name;
  bool istime;
  DateTime time;
  Duration duration;
  Duration currentDuration;

  TaskManagment(this.name, this.time, this.istime, this.duration);

  TaskManagment.fromJson(Map<String, dynamic> data) {
    name = data['name'];
    istime = data['istime'];
    time = stringToDataTime(data['time']);
    duration = stringToDuration(data['duration']);
    currentDuration = stringToDuration(data['duration']);
  }

  Duration stringToDuration(String stDuration) {
    var time = stDuration.split(':');
    var hh = int.parse(time[0]);
    var mm = int.parse(time[1]);
    var ss = int.parse(time[2].substring(0, 2));
    return Duration(hours: hh, minutes: mm, seconds: ss);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'istime': istime,
      'time': time.toString(),
      'duration': duration.toString()
    };
  }

  DateTime stringToDataTime(String time) {
    var yyyy = int.parse(time.substring(0, 4));
    var mm = int.parse(time.substring(5, 7));
    var dd = int.parse(time.substring(8, 10));

    DateTime dara = DateTime.tryParse(time);

    DateTime dataTime = DateTime(yyyy, mm, dd);
    return dara;
  }
}
