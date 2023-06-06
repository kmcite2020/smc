// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class HiveDataSource implements IPersistStore {
  late Box _box;
  @override
  Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox('SMC');
  }

  @override
  Future<void> delete(String key) async => await _box.delete(key);

  @override
  Future<void> deleteAll() async => await _box.clear();

  @override
  Object? read(String key) => _box.get(key);

  @override
  Future<void> write<T>(String key, T value) async => await _box.put(key, value);
}
