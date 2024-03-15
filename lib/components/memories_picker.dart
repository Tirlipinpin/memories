import 'package:flutter/material.dart';
import 'package:memories/model/memory.dart';

class MemoriesPicker extends StatefulWidget {
  final List<Memory> _memories;

  const MemoriesPicker({super.key, required List<Memory> memories})
      : _memories = memories;

  @override
  State<MemoriesPicker> createState() => _MemoriesPickerState();
}

class _MemoriesPickerState extends State<MemoriesPicker> {
  late String _dropdownValue;

  @override
  void initState() {
    super.initState();
    _dropdownValue = widget._memories.first.id;
  }

  void _handleChange(String? value) {
    setState(() {
      _dropdownValue = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (DropdownButton<String>(
      items: widget._memories
          .map<DropdownMenuItem<String>>(
            (Memory e) => (DropdownMenuItem(
              value: e.id,
              child: Text(e.title),
            )),
          )
          .toList(),
      onChanged: _handleChange,
      value: _dropdownValue,
    ));
  }
}
