import 'package:financial_accounting/pages/home_page.dart';
import 'package:financial_accounting/pages/task_page.dart';
import 'package:financial_accounting/pages/time_page.dart';
import 'package:financial_accounting/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPage = 0;
  Function(int) onTapNavigation(BuildContext context, int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: IndexedStack(
        index: _currentPage,
        children: [
          HomePage(),
          //TaskPage(),
          TimePage(),
        ],
      ),
      bottomNavigationBar: navigationBar(
        currentIndex: _currentPage,
        titleIcons: ['Финансы', 'Задачи'],
        onTap: (int index) => onTapNavigation(context, index),
      ),
    );
  }
}
