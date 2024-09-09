import 'dart:typed_data';

import 'package:bc_ur_dart/src/cbor.dart';
import 'package:bc_ur_dart/src/ur.dart';
import 'package:bc_ur_dart/src/xoshiro.dart';


Uint8List makeMessage(int length, {String seed = 'Wolf'}) {
  final rng = Xoshiro(Uint8List.fromList(seed.codeUnits));
  return Uint8List.fromList(rng.nextData(length));
}

UR makeMessageUR(int length, {String seed = 'Wolf'}) {
  final message = makeMessage(length, seed: seed);

  final cborMessage = cborEncode(message);

  return UR(cborMessage);
}
