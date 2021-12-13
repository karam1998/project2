import 'package:flutter/cupertino.dart';

class BnScreen {
  final Widget _screen;
  final String _title;

  BnScreen(
    this._screen,
    this._title,
  );

  Widget get screen => _screen;

  String get title => _title;
}
