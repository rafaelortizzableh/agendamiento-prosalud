import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/providers.dart';
import '../../services/services.dart';
import '../screens.dart';

class DepartmentDropdown extends StatelessWidget {
  DepartmentDropdown({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, _) {
        List<String> deptNames = departments.map((e) => e.name).toList();
        return AppDropdownInput<String?>(
          hintText: "Departamento",
          options: deptNames,
          value: watch(selectedDepartmentProvider).state?.name,
          onChanged: (String? value) async {
            context.read(selectedDepartmentProvider).state =
                departments.firstWhere((element) => element.name == value);
            context.read(selectedLocalityProvider).state = null;
            await context.refresh(remoteLocalitiesListProvider);
          },
          getLabel: (String? value) => value ?? 'Departamento',
        );
      },
    );
  }
}
