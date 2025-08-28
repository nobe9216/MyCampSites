import 'package:flutter/material.dart';

extension AddWidget on Widget {
  Widget addWidget(Widget Function(Widget child) builder, {bool add = true}) =>
      add ? builder(this) : this;
}
