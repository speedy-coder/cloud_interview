import 'package:flutter/material.dart';

///updates all widgets connected to it
class InfoBloc extends ChangeNotifier {
  ///stores our user information [empty when none inserted]
  List<Map<String, dynamic>> _userInfo = [];
  ///stores each data passed
  Map<String, dynamic> _userMap = {};

  ///get user info in list
  List<Map<String, dynamic>> get userInfo => _userInfo;

  void addUserInfo(Map <String,dynamic> info){
    _userMap = info;
   _userInfo.add(_userMap);
    notifyListeners();
  }


}
