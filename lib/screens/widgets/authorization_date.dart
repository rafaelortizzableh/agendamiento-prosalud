import 'package:agendamiento_prosalud/providers/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthorizationDate extends StatelessWidget {
  const AuthorizationDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, _) {
      DateTime? _selectedDate = watch(authotizationDateProvider).state;
      return FormField<DateTime?>(
        builder: (FormFieldState<DateTime?> state) {
          return InputDecorator(
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              labelText: 'Fecha de autorización',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
            ),
            isEmpty: _selectedDate == null,
            child: InkWell(
              onTap: () async {
                DateTime? _date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now().add(Duration(days: 1)),
                  firstDate: DateTime.now().add(Duration(days: 1)),
                  lastDate: DateTime.now().add(
                    Duration(days: 30),
                  ),
                );
                if (_date != null) {
                  context.read(authotizationDateProvider).state = _date;
                }
              },
              child: Text(
                _selectedDate != null
                    ? '${_selectedDate.day}-${_selectedDate.month}-${_selectedDate.year}'
                    : '',
              ),
            ),
          );
        },
      );
    });
  }
}
