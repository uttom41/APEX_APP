import 'package:apex_dmit/main.dart';
import 'package:flutter/material.dart';
import 'index.dart';


abstract class BaseScreen<T extends BaseEntity<T>, VM extends BaseViewModel<T>>
    extends ConsumerStatefulWidget implements ScreenBuilder<T, VM> {
  const BaseScreen({super.key});

  @override
  ConsumerState<BaseScreen<T, VM>> createState() => _BaseScreenState<T, VM>();
}

class _BaseScreenState<T extends BaseEntity<T>, VM extends BaseViewModel<T>>
    extends ConsumerState<BaseScreen<T, VM>>  {

  late VM viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt.get<VM>();

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    viewModel.setRef(ref);
    viewModel.initState();
  }

  @override
  Widget build(BuildContext context) {
      viewModel.buildProps();
    return buildBody(context, viewModel, ref);
  }

  Widget buildBody(BuildContext context, VM viewModel, WidgetRef ref) {
    return (widget as ScreenBuilder<T, VM>).buildBody(context, viewModel);
  }
}

abstract class ScreenBuilder<T extends BaseEntity<T>, VM extends BaseViewModel<T>> {
  Widget buildBody(BuildContext context, VM viewModel);
}
