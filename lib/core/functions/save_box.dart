import 'package:hive/hive.dart';

void saveBox(data, boxName) {
  var box = Hive.box(boxName);
  box.addAll(data);
}
