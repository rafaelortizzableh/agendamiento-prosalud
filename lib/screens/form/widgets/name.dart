import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/providers.dart';

class NameWidget extends ConsumerStatefulWidget {
  const NameWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<NameWidget> createState() => _NameWidgetState();
}

class _NameWidgetState extends ConsumerState<NameWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController.fromValue(
        TextEditingValue(text: ref.read(patientNameProvider)));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      controller: _controller,
      onChanged: (value) =>
          ref.read(patientNameProvider.notifier).state = value,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) =>
          value != null && value.length > 50 ? 'Máximo 50 caracteres' : null,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        labelText: 'Nombre del paciente*',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }
}
