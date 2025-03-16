import '../index.dart';

class BaseNotifier<T extends BaseEntity<T>> extends StateNotifier<BaseState<T>> {
  BaseNotifier(T entity) : super(BaseState(entity: entity));

  void updateEntity(T newEntity) {
    state = BaseState(entity: newEntity);
  }
}


