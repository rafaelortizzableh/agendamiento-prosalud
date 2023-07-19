import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/providers.dart';
import '../../../services/services.dart';
import '../../../core/core.dart';

class DepartmentDropdown extends StatelessWidget {
  const DepartmentDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        List<String> deptNames = departments.map((e) => e.name).toList();
        return AppDropdownInput<String?>(
          hintText: "Departamento",
          options: deptNames,
          value: ref.watch(selectedDepartmentProvider)?.name,
          onChanged: (String? value) async {
            ref.read(selectedDepartmentProvider.notifier).state =
                departments.firstWhere((element) => element.name == value);
            ref.read(selectedLocalityProvider.notifier).state = null;
            ref.invalidate(localLocalitiesListProvider);
          },
          getLabel: (String? value) => value ?? 'Departamento',
        );
      },
    );
  }
}
