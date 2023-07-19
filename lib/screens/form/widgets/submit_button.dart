import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/providers.dart';
import '../../screens.dart';

final _submitEnabledProvider = Provider.autoDispose((ref) {
  return ref.watch(authotizationDateProvider) != null &&
      ref.watch(typeOfTherapyProvider) != null &&
      ref.watch(preferredScheduleProvider) != null &&
      ref.watch(typeOfIdProvider) != null &&
      ref.watch(numberOfTherapiesProvider) > 0 &&
      ref.watch(patientNameProvider).trim().isNotEmpty &&
      ref.watch(patientDiagnosisProvider).trim().isNotEmpty &&
      ref.watch(patientIdNumberProvider).trim().isNotEmpty &&
      ref.watch(telephoneNumberProvider) > 1000000 &&
      ref.watch(patientAgeProvider) > 0 &&
      ref.watch(addressNumberProvider).trim().isNotEmpty;
});

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final canSend = ref.watch(_submitEnabledProvider);
      return ElevatedButton(
        onPressed: canSend
            ? () async => await _validateAndSubmitResults(context, ref)
            : null,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: Text('Solicitar cita'),
        ),
      );
    });
  }

  Future<void> _validateAndSubmitResults(
    BuildContext context,
    WidgetRef ref,
  ) async {
    try {
      ref.read(isLoadingProvider.notifier).state = true;
      final mounted = context.mounted;

      final department = ref.read(selectedDepartmentProvider);
      final locality = ref.read(selectedLocalityProvider);
      final preferedSchedule = ref.read(preferredScheduleProvider)!;
      final typeOfId = ref.read(typeOfIdProvider)!;
      final numberOfTherapies = ref.read(numberOfTherapiesProvider);
      final telephone = ref.read(telephoneNumberProvider);
      final name = ref.read(patientNameProvider).trim();
      final diagnosis = ref.read(patientDiagnosisProvider).trim();
      final idNumber = ref.read(patientIdNumberProvider).trim();
      final insuranceCompany = ref.read(insuranceNameProvider);
      final age = ref.read(patientAgeProvider);
      final address = ref.read(addressNumberProvider).trim();
      final authDate = ref.read(authotizationDateProvider)!;
      final typeOfTherapy = ref.read(typeOfTherapyProvider)!;

      final data = ref.read(formServiceProvider).processData(
            locality: locality,
            department: department,
            name: name,
            typeOfId: typeOfId,
            idNumber: idNumber,
            age: age,
            diagnosis: diagnosis,
            typeOfTherapy: typeOfTherapy,
            address: address,
            insuranceCompany: insuranceCompany,
            telephone: telephone,
            numberOfSessions: numberOfTherapies,
            authDate: authDate,
            preferedSchedule: preferedSchedule,
          );
      final responses = await ref.read(formServiceProvider).submitForm(
            data: data,
          );
      final statusEmail = responses.emailResultStatusCode;
      final statusSheets = responses.sheetsResultStatusCode;
      if (statusEmail == 200 && statusSheets == 200) {
        if (!mounted) return;
        unawaited(
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return const FormSubmittedDialog();
            },
          ),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
      ref.read(isLoadingProvider.notifier).state = false;
      unawaited(
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: const Text('Error'),
              content: Text('$e'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cerrar'),
                ),
              ],
            );
          },
        ),
      );
    } finally {
      ref.read(isLoadingProvider.notifier).state = false;
    }
  }
}

class FormSubmittedDialog extends ConsumerWidget {
  const FormSubmittedDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text('Solicitud realizada'),
      content: const Text(
        'Muy pronto nos pondremos en contacto contigo para confirmar tu agendamiento',
      ),
      actions: [
        TextButton(
          onPressed: () => _resetForm(context, ref),
          child: const Text('Okay'),
        ),
      ],
    );
  }

  void _resetForm(
    BuildContext context,
    WidgetRef ref,
  ) {
    ref.read(selectedDepartmentProvider.notifier).state = null;
    ref.read(selectedLocalityProvider.notifier).state = null;
    ref.read(preferredScheduleProvider.notifier).state = null;
    ref.read(typeOfIdProvider.notifier).state = null;
    ref.read(insuranceNameProvider.notifier).state = null;
    ref.read(authotizationDateProvider.notifier).state = null;
    ref.read(typeOfTherapyProvider.notifier).state = null;
    ref.read(numberOfTherapiesProvider.notifier).state = 0;
    ref.read(telephoneNumberProvider.notifier).state = 0;
    ref.read(patientNameProvider.notifier).state = '';
    ref.read(patientDiagnosisProvider.notifier).state = '';
    ref.read(patientIdNumberProvider.notifier).state = '';
    ref.read(patientAgeProvider.notifier).state = 0;
    ref.read(addressNumberProvider.notifier).state = '';
    unawaited(
      Navigator.pushReplacementNamed(context, FormScreen.route),
    );
  }
}
