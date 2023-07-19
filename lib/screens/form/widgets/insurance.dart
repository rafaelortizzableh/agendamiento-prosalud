import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/providers.dart';
import '../../../services/services.dart';
import '../../../core/core.dart';

class InsuranceWidget extends StatelessWidget {
  const InsuranceWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        List<String> companyNames =
            insuranceCompanies.map((e) => e.name).toList();
        return AppDropdownInput<String?>(
          hintText: 'Entidad aseguradora',
          options: companyNames,
          value: ref.watch(insuranceNameProvider)?.name,
          onChanged: (String? value) async {
            ref.read(insuranceNameProvider.notifier).state = insuranceCompanies
                .firstWhere((element) => element.name == value);
          },
          getLabel: (String? value) => value ?? 'Entidad aseguradora*',
        );
      },
    );
  }
}
