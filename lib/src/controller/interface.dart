import 'dart:async';

abstract class GraphifyController {

  String identifier = "";

  FutureOr<void> update(Map<String, dynamic>? options);

  FutureOr<void> dispose();

}