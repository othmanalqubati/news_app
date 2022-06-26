
import 'package:flutter/cupertino.dart';

class PageModel {
  late String _img;
  late IconData _icon;
  late String _title;
  late String _desc;


  PageModel(this._img, this._icon, this._title, this._desc);


  String get img => _img;

  set img(String value) {
    _img = value;
  }

  IconData get icon => _icon;

  set icon(IconData value) {
    _icon = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  String get desc => _desc;

  set desc(String value) {
    _desc = value;
  }
}