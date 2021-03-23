import 'package:flutter/material.dart';

import '../data.dart';

BottomNavigationBar navigationBar(
    {@required int currentIndex,
    Function onTap(int index),
    @required List<String> titleIcons}) {
  return BottomNavigationBar(
    backgroundColor: Colors.orange,
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    onTap: (int index) => onTap(index),
    currentIndex: currentIndex,
    items: [
      BottomNavigationBarItem(
          icon: Icon(
            Icons.folder,
            color: Colors.white,
          ),
          title: Text(
            titleIcons[0],
            style: st,
          )),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.format_list_numbered,
          color: Colors.white,
        ),
        title: Text(
          titleIcons[1],
          style: st,
        ),
      ),
    ],
  );
}
