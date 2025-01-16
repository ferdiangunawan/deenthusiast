import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  bool get isMobile {
    return MediaQuery.of(this).size.width < 600;
  }
}
