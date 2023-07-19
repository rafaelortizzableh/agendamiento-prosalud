import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/providers.dart';

class AgeWidget extends ConsumerStatefulWidget {
  const AgeWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<AgeWidget> createState() => _AgeWidgetState();
}

class _AgeWidgetState extends ConsumerState<AgeWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    if (ref.read(patientAgeProvider) != 0) {
      _controller = TextEditingController.fromValue(
        TextEditingValue(
          text: ref.read(patientAgeProvider).toString(),
        ),
      );
    } else {
      _controller = TextEditingController();
    }

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
      controller: _controller,
      onChanged: (value) {
        if (value.isNotEmpty) {
          ref.read(patientAgeProvider.notifier).state = int.parse(value);
        } else {
          ref.read(patientAgeProvider.notifier).state = 0;
        }
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) =>
          value != null && value.length > 3 ? 'Máximo 3 caracteres' : null,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        labelText: 'Edad*',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }
}
