class TaskModel {
  String name;
  DateTime time;

  TaskModel(this.name, this.time);

  TaskModel.fromJson(Map<String, dynamic> data) {
    name = data['name'];
    time = stringToDataTime(data['time']);
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'time': time.toString()};
  }
}

DateTime stringToDataTime(String time) {
  var yyyy = int.parse(time.substring(0, 4));
  var mm = int.parse(time.substring(5, 7));
  var dd = int.parse(time.substring(8, 10));

  DateTime dara = DateTime.tryParse(time);

  DateTime dataTime = DateTime(yyyy, mm, dd);
  return dara;
}
