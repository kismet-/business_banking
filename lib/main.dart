import 'package:app_interview/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_widget.dart';

void main() {
  runApp(ModularApp(
    module: AppModule(),
  ));
}