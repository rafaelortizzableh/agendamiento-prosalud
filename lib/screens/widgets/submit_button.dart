import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/providers.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, _) {
      bool _canSend = watch(selectedDepartmentProvider).state != null &&
          watch(selectedLocalityProvider).state != null &&
          watch(authotizationDateProvider).state != null &&
          watch(patientAgeNumberProvider).state != null &&
          watch(typeOfTherapyProvider).state != null &&
          watch(preferredScheduleProvider).state != null &&
          watch(typeOfIdProvider).state != null &&
          watch(numberOfTherapiesProvider).state > 0 &&
          watch(patientNameProvider).state.trim().isNotEmpty &&
          watch(patientDiagnosisProvider).state.trim().isNotEmpty &&
          watch(patientIdNumberProvider).state.trim().isNotEmpty &&
          watch(insuranceNameProvider).state.trim().isNotEmpty &&
          watch(telephoneNumberProvider).state > 1000000 &&
          watch(sessionsNumberProvider).state.trim().isNotEmpty &&
          watch(patientAgeProvider).state.trim().isNotEmpty &&
          watch(addressNumberProvider).state.trim().isNotEmpty;
      return ElevatedButton(
        onPressed: _canSend
            ? () {
                String departmentName =
                    context.read(selectedDepartmentProvider).state?.name ??
                        'Santander';
                String localityName =
                    context.read(selectedLocalityProvider).state?.name ??
                        'Bucaramanga';
                DateTime authorizationDate =
                    context.read(authotizationDateProvider).state!;
                int patientAge =
                    context.read(patientAgeNumberProvider).state ?? 0;
                String typeOfTherapy =
                    context.read(typeOfTherapyProvider).state?.therapyName ??
                        '';
                String scheduleTime =
                    context.read(preferredScheduleProvider).state?.time ?? '';
                String typeOfId =
                    context.read(typeOfIdProvider).state?.type ?? '';
                int numberOfTherapies =
                    context.read(numberOfTherapiesProvider).state;
                int telephone = context.read(telephoneNumberProvider).state;
                String name = context.read(patientNameProvider).state.trim();
                String diagnosis =
                    context.read(patientDiagnosisProvider).state.trim();
                String idNumber =
                    context.read(patientIdNumberProvider).state.trim();
                String insuranceCompany =
                    context.read(insuranceNameProvider).state.trim();
                String numberOfsessions =
                    context.read(sessionsNumberProvider).state.trim();
                String age = context.read(patientAgeProvider).state.trim();
                String address =
                    context.read(addressNumberProvider).state.trim();
              }
            : null,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: Text('Solicitar cita'),
        ),
      );
    });
  }
}
