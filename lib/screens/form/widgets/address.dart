import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/providers.dart';

class AddressWidget extends ConsumerStatefulWidget {
  const AddressWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<AddressWidget> createState() => _AddressWidgetState();
}

class _AddressWidgetState extends ConsumerState<AddressWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController.fromValue(
      TextEditingValue(text: ref.read(addressNumberProvider)),
    );
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
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) =>
          value != null && value.length > 50 ? 'Máximo 50 caracteres' : null,
      onChanged: (value) =>
          ref.read(addressNumberProvider.notifier).state = value,
      keyboardType: TextInputType.streetAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        labelText: 'Dirección*',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }
}
