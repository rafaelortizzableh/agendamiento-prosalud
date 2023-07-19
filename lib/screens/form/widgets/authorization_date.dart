import 'package:agendamiento_prosalud/providers/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthorizationDate extends StatelessWidget {
  const AuthorizationDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        DateTime? selectedDate = ref.watch(authotizationDateProvider);
        return FormField<DateTime?>(
          builder: (FormFieldState<DateTime?> state) {
            return InputDecorator(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 15.0),
                labelText: 'Fecha de autorización*',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
              isEmpty: selectedDate == null,
              child: InkWell(
                onTap: () async {
                  DateTime? date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now().add(const Duration(days: 1)),
                    firstDate: DateTime.now().add(const Duration(days: 1)),
                    lastDate: DateTime.now().add(
                      const Duration(days: 30),
                    ),
                  );
                  if (date != null) {
                    ref.read(authotizationDateProvider.notifier).state = date;
                  }
                },
                child: Text(
                  selectedDate != null
                      ? '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}'
                      : '',
                ),
              ),
            );
          },
        );
      },
    );
  }
}
