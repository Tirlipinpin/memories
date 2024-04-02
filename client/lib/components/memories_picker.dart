import 'package:flutter/material.dart';
import 'package:memories/model/memory.dart';

class MemoriesPicker extends StatefulWidget {
  final List<Memory> _memories;
  final String? _dropdownValue;
  final Function(String?) _onChanged;

  const MemoriesPicker(
      {super.key,
      required List<Memory> memories,
      required String? dropdownValue,
      required Function(String?) onChanged})
      : _memories = memories,
        _dropdownValue = dropdownValue,
        _onChanged = onChanged;

  @override
  State<MemoriesPicker> createState() => _MemoriesPickerState();
}

class _MemoriesPickerState extends State<MemoriesPicker> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Memory"
      ),
      isExpanded: true,
      items: widget._memories
          .map<DropdownMenuItem<String>>(
            (Memory e) => (DropdownMenuItem(
              value: e.id,
              child: Text(e.title),
            )),
          )
          .toList(),
      value: widget._dropdownValue,
      onChanged: widget._onChanged,
    );
  }
}
