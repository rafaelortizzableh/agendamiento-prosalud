import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/providers.dart';
import '../../models/models.dart';
import '../screens.dart';

class PreferedScheduleDropdown extends StatelessWidget {
  PreferedScheduleDropdown({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, _) {
        List<Schedule> _schedules = [
          Schedule(time: '8:00 - 9:00', id: 1),
          Schedule(time: '9:00 - 10:00', id: 2),
          Schedule(time: '10:00 - 11:00', id: 2),
          Schedule(time: '11:00 - 12:00', id: 4),
          Schedule(time: '12:00 - 13:00', id: 5),
          Schedule(time: '13:00 - 14:00', id: 6),
          Schedule(time: '14:00 - 15:00', id: 7),
          Schedule(time: '15:00 - 16:00', id: 8),
          Schedule(time: '16:00 - 17:00', id: 9),
          Schedule(time: '17:00 - 18:00', id: 10),
          Schedule(time: '18:00 - 19:00', id: 11),
          Schedule(time: '19:00 - 20:00', id: 12),
          Schedule(time: '20:00 - 21:00', id: 13),
        ];
        List<String> _scheduleNames = _schedules.map((e) => e.time).toList();
        return AppDropdownInput<String?>(
          hintText: 'Horario preferente',
          options: _scheduleNames,
          value: watch(preferredScheduleProvider).state?.time,
          onChanged: (String? value) async {
            context.read(preferredScheduleProvider).state =
                _schedules.firstWhere((element) => element.time == value);
          },
          getLabel: (String? value) => value ?? 'Horario preferente',
        );
      },
    );
  }
}
