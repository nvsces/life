import 'package:financial_accounting/bloc/bloc_day_time/day_time_bloc.dart';
import 'package:financial_accounting/models/user.dart';
import 'package:financial_accounting/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'authhorazation_page.dart';
import 'home_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = context.watch<User>();
    final bool isLoggedIn = user != null;
    //return isLoggedIn ? HomePage() : AuthorizationPage();
    return isLoggedIn
        ? BlocProvider(create: (ctx) => BlocDayTime(), child: HomeScreen())
        : AuthorizationPage();
  }
}
