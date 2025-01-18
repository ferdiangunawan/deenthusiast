import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  bool get isMobile {
    return MediaQuery.of(this).size.width < 600;
  }

  bool get isTablet {
    return MediaQuery.of(this).size.width > 600 &&
        MediaQuery.of(this).size.width < 950;
  }

  bool get isWeb => !isMobile && !isTablet;
}
