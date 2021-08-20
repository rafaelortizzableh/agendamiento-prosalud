import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/providers.dart';

class DiagnosisWidget extends StatefulWidget {
  const DiagnosisWidget({Key? key}) : super(key: key);

  @override
  _DiagnosisWidgetState createState() => _DiagnosisWidgetState();
}

class _DiagnosisWidgetState extends State<DiagnosisWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController.fromValue(
        TextEditingValue(text: context.read(patientDiagnosisProvider).state));
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
      onChanged: (value) =>
          context.read(patientDiagnosisProvider).state = value,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) =>
          value != null && value.length > 300 ? 'Máximo 300 caracteres' : null,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        labelText: 'Diagnóstico del paciente*',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }
}
