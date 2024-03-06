import 'dart:convert';

import 'package:flutter/services.dart';

class Branch{
  String _name;
  int _id;
  String _tel;
  double _lat;
  double _lng;
  String _manager;

  Branch(this._name , this._id , this._tel , this._lat , this._lng , this._manager);

  String get name => _name;
  int get id => _id;
  String get tel => _tel;
  double get lat => _lat;
  double get lng => _lng;
  String get manager => _manager;
}
