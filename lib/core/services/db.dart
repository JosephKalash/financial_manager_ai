import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

abstract final class DB {
  static late Isar isar;
  static Future<void> initDB() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.getInstance('isarIntance') != null) {
      isar = Isar.getInstance('isarIntance')!;
    } else
      isar = await Isar.open(
        [],
        directory: dir.path,
        name: 'isarIntance',
      );
  }

  static int fastHash(String string) {
    var hash = 0xcbf29ce484222325;

    var i = 0;
    while (i < string.length) {
      final codeUnit = string.codeUnitAt(i++);
      hash ^= codeUnit >> 8;
      hash *= 0x100000001b3;
      hash ^= codeUnit & 0xFF;
      hash *= 0x100000001b3;
    }

    return hash;
  }
}
