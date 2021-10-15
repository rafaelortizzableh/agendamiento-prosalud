import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/providers.dart';
import '../../../models/models.dart';
import '../../screens.dart';

class TypeOfIdDropdown extends StatelessWidget {
  const TypeOfIdDropdown({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, _) {
        List<TypeOfId> _typeOfIds = [
          TypeOfId(type: 'Cédula de ciudadanía', id: 1),
          TypeOfId(type: 'Tarjeta de identidad', id: 2),
          TypeOfId(type: 'Registro Civil', id: 2),
          TypeOfId(type: 'Cédula de extranjería', id: 4),
          TypeOfId(type: 'Pasaporte', id: 5),
        ];
        List<String> idNames = _typeOfIds.map((e) => e.type).toList();
        return AppDropdownInput<String?>(
          hintText: "Tipo de documento*",
          options: idNames,
          value: watch(typeOfIdProvider).state?.type,
          onChanged: (String? value) async {
            context.read(typeOfIdProvider).state =
                _typeOfIds.firstWhere((element) => element.type == value);
          },
          getLabel: (String? value) => value ?? 'Tipo de documento*',
        );
      },
    );
  }
}
