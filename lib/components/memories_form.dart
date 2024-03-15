import 'package:flutter/material.dart';
import 'package:memories/components/memories_picker.dart';
import 'package:memories/repositories/memories_repository.dart';
import 'package:provider/provider.dart';

class MemoriesForm extends StatefulWidget {
  const MemoriesForm({super.key});

  @override
  State<MemoriesForm> createState() => _MemoriesFormState();
}

class _MemoriesFormState extends State<MemoriesForm> {
  final _formKey = GlobalKey<FormState>();
  String? _dropdownValue;

  void _onDropdownChanged(String? value) {
    setState(() {
      _dropdownValue = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (Form(
      key: _formKey,
      child: SizedBox(
        width: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            MemoriesPicker(
              memories: Provider.of<MemoriesRepository>(context).memories,
              onChanged: _onDropdownChanged,
              dropdownValue: _dropdownValue,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Provider.of<MemoriesRepository>(context, listen: false)
                        .selectMemory(_dropdownValue!);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Memory selected')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
