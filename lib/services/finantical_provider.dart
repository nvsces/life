import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financial_accounting/models/expenses.dart';
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

  Future setTime(TaskManagment tskm) async {
    CollectionReference taskC = FirebaseFirestore.instance.collection("time");
    var doc = taskC.doc(tskm.name);
    return await doc.set(tskm.toMap());
  }

  Stream<List<TaskManagment>> getTimes() {
    CollectionReference taskC = FirebaseFirestore.instance.collection("time");
    return taskC.snapshots().map((QuerySnapshot data) =>
        data.docs.map((doc) => TaskManagment.fromJson(doc.data())).toList());
  }
}
