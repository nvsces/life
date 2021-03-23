import 'package:financial_accounting/bloc/expenses_bloc.dart';
import 'package:financial_accounting/models/expenses.dart';

abstract class ExpensesState {}

class ExpensesFirstState extends ExpensesState {}

class ExpensesLoadedState extends ExpensesState {
  List<int> expenses;
  BlocExpenses bloc;
  ExpensesLoadedState(this.expenses, this.bloc);
}

class DiagrammState extends ExpensesState {
  Map<String, double> dataMap;
  DiagrammState(this.dataMap);
}
