import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/providers.dart';
import '../../../services/services.dart';
import '../../screens.dart';

class InsuranceWidget extends StatelessWidget {
  const InsuranceWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, _) {
        List<String> _companyNames =
            insuranceCompanies.map((e) => e.name).toList();
        return AppDropdownInput<String?>(
          hintText: 'Entidad aseguradora*',
          options: _companyNames,
          value: watch(insuranceNameProvider).state?.name,
          onChanged: (String? value) async {
            context.read(insuranceNameProvider).state = insuranceCompanies
                .firstWhere((element) => element.name == value);
          },
          getLabel: (String? value) => value ?? 'Entidad aseguradora*',
        );
      },
    );
  }
}
