import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/providers.dart';
import '../../../models/models.dart';
import '../../../core/core.dart';

class TypeOfIdDropdown extends StatelessWidget {
  const TypeOfIdDropdown({Key? key}) : super(key: key);
  static const List<TypeOfId> _typeOfIds = [
    TypeOfId(type: 'Cédula de ciudadanía', id: 1),
    TypeOfId(type: 'Tarjeta de identidad', id: 2),
    TypeOfId(type: 'Registro Civil', id: 2),
    TypeOfId(type: 'Cédula de extranjería', id: 4),
    TypeOfId(type: 'Pasaporte', id: 5),
  ];
  static final List<String> _idNames = _typeOfIds.map((e) => e.type).toList();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return AppDropdownInput<String?>(
          hintText: "Tipo de documento*",
          options: _idNames,
          value: ref.watch(typeOfIdProvider)?.type,
          onChanged: (String? value) async {
            ref.read(typeOfIdProvider.notifier).state = _typeOfIds.firstWhere(
              (element) => element.type == value,
            );
          },
          getLabel: (String? value) => value ?? 'Tipo de documento*',
        );
      },
    );
  }
}
