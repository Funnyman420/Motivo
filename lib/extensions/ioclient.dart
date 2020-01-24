import 'dart:io';
import 'package:http/io_client.dart';

extension MotivoClient on HttpClient {
  IOClient getIOClient() {
    var trustSelfSigned = true;
    this.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => trustSelfSigned);
    return IOClient(this);
  }
}
