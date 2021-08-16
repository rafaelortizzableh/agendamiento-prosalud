import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/models.dart';
import '../../providers/providers.dart';

class IdNumberWidget extends StatelessWidget {
  const IdNumberWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, _) {
      TypeOfId? _typeOfId = watch(typeOfIdProvider).state;
      return _typeOfId != null
          ? Column(
              children: [
                SizedBox(height: 16),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => value == null || value.length > 15
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
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                    labelText: 'Número de identidad',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
              ],
            )
          : SizedBox();
    });
  }
}
