import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/models.dart';
import '../../../providers/providers.dart';
import '../../screens.dart';

class LocalityDropdown extends StatelessWidget {
  LocalityDropdown({Key? key, required this.isTwoColumn}) : super(key: key);
  final bool isTwoColumn;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, _) {
        Department? _selectedDepartment =
            watch(selectedDepartmentProvider).state;

        if (_selectedDepartment != null) {
          var localitiesProvider = watch(remoteLocalitiesListProvider);
          return localitiesProvider.when(
            data: (data) {
              List<String> localityNames = data != null && data.isNotEmpty
                  ? data.map((e) => e.name).toList()
                  : [];
              return !isTwoColumn
                  ? Column(
                      children: [
                        SizedBox(height: 16),
                        AppDropdownInput<String?>(
                          hintText: "Municipio",
                          options: localityNames,
                          value: watch(selectedLocalityProvider).state?.name,
                          onChanged: (String? value) {
                            context.read(selectedLocalityProvider).state = data!
                                .firstWhere((element) => element.name == value);
                          },
                          getLabel: (String? value) => value ?? 'Municipio',
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        SizedBox(width: 16),
                        Expanded(
                          child: AppDropdownInput<String?>(
                            hintText: "Municipio",
                            options: localityNames,
                            value: watch(selectedLocalityProvider).state?.name,
                            onChanged: (String? value) {
                              context.read(selectedLocalityProvider).state =
                                  data!.firstWhere(
                                      (element) => element.name == value);
                            },
                            getLabel: (String? value) => value ?? 'Municipio',
                          ),
                        ),
                      ],
                    );
            },
            loading: () => Center(child: CircularProgressIndicator()),
            error: (error, _) => Center(child: Icon(Icons.error)),
          );
        }
        return SizedBox();
      },
    );
  }
}
