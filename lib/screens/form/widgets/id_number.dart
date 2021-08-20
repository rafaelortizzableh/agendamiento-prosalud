import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/models.dart';
import '../../../providers/providers.dart';

class IdNumberWidget extends StatefulWidget {
  const IdNumberWidget({Key? key, required this.isTwoColumn}) : super(key: key);
  final bool isTwoColumn;

  @override
  _IdNumberWidgetState createState() => _IdNumberWidgetState();
}

class _IdNumberWidgetState extends State<IdNumberWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController.fromValue(
        TextEditingValue(text: context.read(patientIdNumberProvider).state));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, _) {
      TypeOfId? _typeOfId = watch(typeOfIdProvider).state;
      if (_typeOfId != null) {
        return !widget.isTwoColumn
            ? Column(
                children: [
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _controller,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => value != null && value.length > 15
                        ? 'Máximo 15 caracteres'
                        : null,
                    onChanged: (value) =>
                        context.read(patientIdNumberProvider).state = value,
                    keyboardType: _typeOfId.id != 5
                        ? TextInputType.number
                        : TextInputType.text,
                    textInputAction: TextInputAction.next,
                    inputFormatters: _typeOfId.id != 5
                        ? [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ]
                        : [],
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15.0),
                      labelText: 'Número de identidad*',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                ],
              )
            : Row(
                children: [
                  SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      controller: _controller,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value != null && value.length > 15
                          ? 'Máximo 15 caracteres'
                          : null,
                      onChanged: (value) =>
                          context.read(patientIdNumberProvider).state = value,
                      keyboardType: _typeOfId.id != 5
                          ? TextInputType.number
                          : TextInputType.text,
                      textInputAction: TextInputAction.next,
                      inputFormatters: _typeOfId.id != 5
                          ? [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ]
                          : [],
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15.0),
                        labelText: 'Número de identidad*',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ),
                ],
              );
      } else {
        return SizedBox();
      }
    });
  }
}
