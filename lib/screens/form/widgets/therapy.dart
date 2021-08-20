import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/providers.dart';
import '../../../services/services.dart';
import '../../screens.dart';

class TypeOfTherapyDropDown extends StatelessWidget {
  TypeOfTherapyDropDown({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, _) {
        List<String> _therapyNames =
            therapies.map((e) => e.therapyName).toList();
        return AppDropdownInput<String?>(
          hintText: 'Tipo de terapia*',
          options: _therapyNames,
          value: watch(typeOfTherapyProvider).state?.therapyName,
          onChanged: (String? value) async {
            context.read(typeOfTherapyProvider).state =
                therapies.firstWhere((element) => element.therapyName == value);
          },
          getLabel: (String? value) => value ?? 'Tipo de terapia*',
        );
      },
    );
  }
}
