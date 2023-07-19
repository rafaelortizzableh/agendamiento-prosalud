import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/providers.dart';
import '../../../core/core.dart';

class LocalityDropdown extends StatelessWidget {
  const LocalityDropdown({Key? key, required this.isTwoColumn})
      : super(key: key);
  final bool isTwoColumn;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final selectedDepartment = ref.watch(
          selectedDepartmentProvider,
        );

        if (selectedDepartment != null) {
          var localitiesProvider = ref.watch(localLocalitiesListProvider);
          return localitiesProvider.when(
            data: (data) {
              List<String> localityNames = data != null && data.isNotEmpty
                  ? data.map((e) => e.name).toList()
                  : [];
              return !isTwoColumn
                  ? Column(
                      children: [
                        const SizedBox(height: 16),
                        AppDropdownInput<String?>(
                          hintText: "Municipio",
                          options: localityNames,
                          value: ref.watch(selectedLocalityProvider)?.name,
                          onChanged: (String? value) {
                            ref.read(selectedLocalityProvider.notifier).state =
                                data!.firstWhere(
                                    (element) => element.name == value);
                          },
                          getLabel: (String? value) => value ?? 'Municipio',
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        const SizedBox(width: 8),
                        Expanded(
                          child: AppDropdownInput<String?>(
                            hintText: "Municipio",
                            options: localityNames,
                            value: ref.watch(selectedLocalityProvider)?.name,
                            onChanged: (String? value) {
                              ref
                                      .read(selectedLocalityProvider.notifier)
                                      .state =
                                  data!.firstWhere(
                                      (element) => element.name == value);
                            },
                            getLabel: (String? value) => value ?? 'Municipio',
                          ),
                        ),
                      ],
                    );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, _) => const Center(child: Icon(Icons.error)),
          );
        }
        return const SizedBox();
      },
    );
  }
}
