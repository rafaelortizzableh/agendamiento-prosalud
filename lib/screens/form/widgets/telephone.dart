import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/providers.dart';

class TelephoneWidget extends ConsumerStatefulWidget {
  const TelephoneWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<TelephoneWidget> createState() => _TelephoneWidgetState();
}

class _TelephoneWidgetState extends ConsumerState<TelephoneWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    if (ref.read(telephoneNumberProvider) != 0) {
      _controller = TextEditingController.fromValue(
          TextEditingValue(text: ref.read(telephoneNumberProvider).toString()));
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
          ref.read(telephoneNumberProvider.notifier).state = int.parse(value);
        } else {
          ref.read(telephoneNumberProvider.notifier).state = 0;
        }
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) =>
          value != null && value.length > 10 ? 'Máximo 10 caracteres' : null,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        labelText: 'Teléfono del paciente*',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }
}
