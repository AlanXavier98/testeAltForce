import 'package:flutter/material.dart';

class FilterProductWidget extends StatefulWidget {
  // label é o texto que vai se mostrado no input antes de digitar algo
  var label;
  // TODO Ira servir para mostrar se está selecionado ou nao
  bool? select;
  FilterProductWidget({super.key, @required this.label, @required this.select});

  @override
  State<FilterProductWidget> createState() => _FilterProductWidgetState();
}

class _FilterProductWidgetState extends State<FilterProductWidget> {
  @override
  Widget build(BuildContext context) {
    return FilterChip(label: Text(widget.label), onSelected: (bool value) {});
  }
}
