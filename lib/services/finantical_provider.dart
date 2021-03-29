import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financial_accounting/models/day_time.dart';
import 'package:financial_accounting/models/expenses.dart';
import 'package:financial_accounting/models/statistics_model.dart';
import 'package:financial_accounting/models/task_managment.dart';
import 'package:financial_accounting/models/task_model.dart';

class FinanticalProvider {
  final CollectionReference _expensesCollection =
      FirebaseFirestore.instance.collection("expenses");

  Future addExpenses(Expenses expenses) async {
    CollectionReference catygoryCollection =
        FirebaseFirestore.instance.collection(expenses.category);
    var _doc = catygoryCollection.doc();
    return await _doc.set(expenses.toMap());
  }

  Stream<List<Expenses>> getExpenses(String category) {
    CollectionReference catygoryCollection =
        FirebaseFirestore.instance.collection(category);
    return catygoryCollection.snapshots().map((QuerySnapshot data) => data.docs
        .map((DocumentSnapshot doc) => Expenses.fromJson(doc.data()))
        .toList());
  }

  Future setTask(TaskModel task) async {
    CollectionReference taskC = FirebaseFirestore.instance.collection("task");
    var doc = taskC.doc();
    return await doc.set(task.toMap());
  }

  Future<QuerySnapshot> getTaskSnapshot() {
    CollectionReference taskC = FirebaseFirestore.instance.collection("task");
    return taskC.snapshots().first;
  }

  Stream<List<TaskModel>> getTasks() {
    CollectionReference taskC = FirebaseFirestore.instance.collection("task");
    return taskC.snapshots().map((QuerySnapshot data) =>
        data.docs.map((doc) => TaskModel.fromJson(doc.data())).toList());
  }

  Future setDayTime(DayTime dayTime) async {
    CollectionReference taskC =
        FirebaseFirestore.instance.collection('daytime');
    var doc = taskC.doc();
    dayTime.doc = doc.id;
    return await doc.set(dayTime.toMap());
  }

  Stream<List<DayTime>> getDayTimeList() {
    CollectionReference taskC =
        FirebaseFirestore.instance.collection("daytime");
    return taskC.snapshots().map((QuerySnapshot data) =>
        data.docs.map((doc) => DayTime.fromJson(doc.data())).toList());
  }

  Stream<List<DayTime>> getStatistics() {
    CollectionReference taskC =
        FirebaseFirestore.instance.collection("daytime");
    return taskC.snapshots().map((QuerySnapshot data) =>
        data.docs.map((doc) => DayTime.fromJson(doc.data())).toList());
  }

  Stream<DayTime> getDayTime() {
    CollectionReference taskC =
        FirebaseFirestore.instance.collection("daytime");
    return taskC
        .snapshots()
        .map((QuerySnapshot data) => DayTime.fromJson(data.docs.first.data()));
  }

  Future updateDayTime(DayTime dayTime) async {
    CollectionReference taskC =
        FirebaseFirestore.instance.collection('daytime');
    var doc = taskC.doc(dayTime.doc);
    return await doc.set(dayTime.toMap());
  }
}
