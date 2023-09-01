import 'package:flutter/material.dart';

class BaseWidget<T extends ChangeNotifier> extends StatefulWidget {
  final Widget child;
  final Function(T) onModelReady;
  final T viewModel;

  const BaseWidget(
      {super.key,
      required this.onModelReady,
      required this.viewModel,
      required this.child});

  @override
  _BaseWidgetState<T> createState() => _BaseWidgetState<T>();
}

class _BaseWidgetState<T extends ChangeNotifier> extends State<BaseWidget<T>> {
  late T _model;

  @override
  void initState() {
    super.initState();
    _model = widget.viewModel;

    if (widget.onModelReady != null) {
      widget.onModelReady(_model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _model,
      child: widget.child,
    );
  }
}
