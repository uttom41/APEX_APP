
import 'package:apex_dmit/main.dart';
import '../index.dart';

class BaseState<T extends BaseEntity<T>> {
  final T entity;

  BaseState({required this.entity});
}

class BaseStateProvider<T extends BaseEntity<T>> {
  final StateNotifierProvider<BaseNotifier<T>, BaseState<T>> provider;

  BaseStateProvider()
      : provider = StateNotifierProvider<BaseNotifier<T>, BaseState<T>>((ref) {
    return BaseNotifier<T>(getIt.get<T>());
  });
}