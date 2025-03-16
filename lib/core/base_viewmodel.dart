import 'index.dart';

abstract class BaseViewModel<T extends BaseEntity<T>> {
  late final StateNotifierProvider<BaseNotifier<T>, BaseState<T>> _entityProvider;
  late WidgetRef ref;

  BaseViewModel() : _entityProvider = BaseStateProvider<T>().provider;


  void setRef(WidgetRef ref) {
    this.ref = ref;
  }

  T getEntity() {
    return ref.watch(_entityProvider).entity;
  }

  void initState();

  void buildProps();

  void updateEntity(T newEntity) {
    ref.read(_entityProvider.notifier).updateEntity(newEntity);
  }
}
