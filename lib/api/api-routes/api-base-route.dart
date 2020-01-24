import 'package:flutter/foundation.dart' as Foundation;

class Api {
  static String get base =>
   Foundation.kDebugMode
      ? 'https://funnyman/motivoApi'
      : "https://www.mikegeorgiadiscv.com/motivoApi";
}
