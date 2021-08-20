import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/providers.dart';

class SessionsWidget extends StatefulWidget {
  const SessionsWidget({Key? key}) : super(key: key);

  @override
  _SessionsWidgetState createState() => _SessionsWidgetState();
}

class _SessionsWidgetState extends State<SessionsWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    if (context.read(numberOfTherapiesProvider).state != 0) {
      _controller = TextEditingController.fromValue(TextEditingValue(
          text: context.read(numberOfTherapiesProvider).state.toString()));
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
          context.read(numberOfTherapiesProvider).state = int.parse(value);
        } else {
          context.read(numberOfTherapiesProvider).state = 0;
        }
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) =>
          value != null && value.length > 2 ? 'Máximo 2 caracteres' : null,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        labelText: 'Número de sesiones*',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }
}
