import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/providers.dart';
import '../../../services/services.dart';
import '../../screens.dart';

class PreferredScheduleDropdown extends StatelessWidget {
  const PreferredScheduleDropdown({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, _) {
        List<String> _scheduleNames = schedules.map((e) => e.time).toList();
        return AppDropdownInput<String?>(
          hintText: 'Horario preferente*',
          options: _scheduleNames,
          value: watch(preferredScheduleProvider).state?.time,
          onChanged: (String? value) async {
            context.read(preferredScheduleProvider).state =
                schedules.firstWhere((element) => element.time == value);
          },
          getLabel: (String? value) => value ?? 'Horario preferente*',
        );
      },
    );
  }
}
