import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/providers.dart';
import '../../../services/services.dart';
import '../../../core/core.dart';

class PreferredScheduleDropdown extends StatelessWidget {
  const PreferredScheduleDropdown({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final scheduleNames = schedules.map((e) => e.time).toList();
        return AppDropdownInput<String?>(
          hintText: 'Horario preferente*',
          options: scheduleNames,
          value: ref.watch(preferredScheduleProvider)?.time,
          onChanged: (String? value) async {
            ref.read(preferredScheduleProvider.notifier).state =
                schedules.firstWhere(
              (element) => element.time == value,
            );
          },
          getLabel: (String? value) => value ?? 'Horario preferente*',
        );
      },
    );
  }
}
