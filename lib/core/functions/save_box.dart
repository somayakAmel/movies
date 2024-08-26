import 'package:hive/hive.dart';

void saveBoxAsList(data, boxName) {
  var box = Hive.box(boxName);
  box.addAll(data);
}

void saveBoxAsMap(key, value, boxName) {
  var box = Hive.box(boxName);
  box.put(key, value);
}
