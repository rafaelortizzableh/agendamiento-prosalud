import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/providers.dart';
import '../../../services/services.dart';
import '../../../core/core.dart';

class TypeOfTherapyDropDown extends StatelessWidget {
  const TypeOfTherapyDropDown({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        List<String> therapyNames =
            therapies.map((e) => e.therapyName).toList();
        return AppDropdownInput<String?>(
          hintText: 'Tipo de terapia*',
          options: therapyNames,
          value: ref.watch(typeOfTherapyProvider)?.therapyName,
          onChanged: (String? value) async {
            ref.read(typeOfTherapyProvider.notifier).state =
                therapies.firstWhere(
              (element) => element.therapyName == value,
            );
          },
          getLabel: (String? value) => value ?? 'Tipo de terapia*',
        );
      },
    );
  }
}
