import 'package:financial_accounting/models/expenses.dart';

abstract class ExpensesEvent {}

class ExpensesStartEvent extends ExpensesEvent {}

class ExpensesUpdateListEvent extends ExpensesEvent {
  List<int> expenses;
  ExpensesUpdateListEvent(this.expenses);
}

class DiagrammEvent extends ExpensesEvent {}
