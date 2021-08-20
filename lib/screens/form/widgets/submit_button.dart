import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/providers.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, _) {
      return ElevatedButton(
        onPressed: watch(authotizationDateProvider).state != null &&
                watch(typeOfTherapyProvider).state != null &&
                watch(preferredScheduleProvider).state != null &&
                watch(typeOfIdProvider).state != null &&
                watch(insuranceNameProvider).state != null &&
                watch(numberOfTherapiesProvider).state > 0 &&
                watch(patientNameProvider).state.trim().isNotEmpty &&
                watch(patientDiagnosisProvider).state.trim().isNotEmpty &&
                watch(patientIdNumberProvider).state.trim().isNotEmpty &&
                watch(telephoneNumberProvider).state > 1000000 &&
                watch(patientAgeProvider).state > 0 &&
                watch(addressNumberProvider).state.trim().isNotEmpty
            ? () {
                String departmentName =
                    context.read(selectedDepartmentProvider).state?.name ?? '';
                String localityName =
                    context.read(selectedLocalityProvider).state?.name ?? '';
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
                    context.read(insuranceNameProvider).state?.name ?? '';
                int age = context.read(patientAgeProvider).state;
                String address =
                    context.read(addressNumberProvider).state.trim();
                DateTime? authorizationDate =
                    context.read(authotizationDateProvider).state;

                print({
                  departmentName,
                  localityName,
                  authorizationDate,
                  typeOfTherapy,
                  scheduleTime,
                  typeOfId,
                  numberOfTherapies,
                  telephone,
                  name,
                  diagnosis,
                  idNumber,
                  insuranceCompany,
                  numberOfTherapies,
                  age,
                  address
                });
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
