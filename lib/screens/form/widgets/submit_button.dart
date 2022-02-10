import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/providers.dart';
import '../../../models/models.dart';
import '../../../services/services.dart';
import '../../screens.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, _) {
      var _canSend = watch(authotizationDateProvider).state != null &&
          watch(typeOfTherapyProvider).state != null &&
          watch(preferredScheduleProvider).state != null &&
          watch(typeOfIdProvider).state != null &&
          watch(numberOfTherapiesProvider).state > 0 &&
          watch(patientNameProvider).state.trim().isNotEmpty &&
          watch(patientDiagnosisProvider).state.trim().isNotEmpty &&
          watch(patientIdNumberProvider).state.trim().isNotEmpty &&
          watch(telephoneNumberProvider).state > 1000000 &&
          watch(patientAgeProvider).state > 0 &&
          watch(addressNumberProvider).state.trim().isNotEmpty;
      return ElevatedButton(
        onPressed: _canSend
            ? () async => await _validateAndSubmitResults(context)
            : null,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: Text('Solicitar cita'),
        ),
      );
    });
  }

  Future<void> _validateAndSubmitResults(BuildContext context) async {
    try {
      context.read(isLoadingProvider).state = true;
      Department? department = context.read(selectedDepartmentProvider).state;
      Locality? locality = context.read(selectedLocalityProvider).state;
      Schedule preferedSchedule =
          context.read(preferredScheduleProvider).state!;
      TypeOfId typeOfId = context.read(typeOfIdProvider).state!;
      int numberOfTherapies = context.read(numberOfTherapiesProvider).state;
      int telephone = context.read(telephoneNumberProvider).state;
      String name = context.read(patientNameProvider).state.trim();
      String diagnosis = context.read(patientDiagnosisProvider).state.trim();
      String idNumber = context.read(patientIdNumberProvider).state.trim();
      InsuranceCompany? insuranceCompany =
          context.read(insuranceNameProvider).state;
      int age = context.read(patientAgeProvider).state;
      String address = context.read(addressNumberProvider).state.trim();
      DateTime authDate = context.read(authotizationDateProvider).state!;
      Therapy typeOfTherapy = context.read(typeOfTherapyProvider).state!;

      Map<String, dynamic> data = context.read(formServiceProvider).processData(
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
      int statusEmail = await context
          .read(formServiceProvider)
          .submitForm(data: data, type: SubmitSheetsOrEmailFunction.email);
      int statusSheets = await context
          .read(formServiceProvider)
          .submitForm(data: data, type: SubmitSheetsOrEmailFunction.sheets);
      if (statusEmail == 200 && statusSheets == 200) {
        context.read(isLoadingProvider).state = false;
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return FormSubmittedDialog();
          },
        );
      }
    } catch (e) {
      debugPrint(e.toString());
      context.read(isLoadingProvider).state = false;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('$e'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cerrar'),
              ),
            ],
          );
        },
      );
    }
  }
}

class FormSubmittedDialog extends StatelessWidget {
  const FormSubmittedDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Solicitud realizada'),
      content: Text(
          'Muy pronto nos pondremos en contacto contigo para confirmar tu agendamiento'),
      actions: [
        TextButton(
          onPressed: () => _resetForm(context),
          child: Text('Okay'),
        ),
      ],
    );
  }

  void _resetForm(BuildContext context) {
    context.read(selectedDepartmentProvider).state = null;
    context.read(selectedLocalityProvider).state = null;
    context.read(preferredScheduleProvider).state = null;
    context.read(typeOfIdProvider).state = null;
    context.read(insuranceNameProvider).state = null;
    context.read(authotizationDateProvider).state = null;
    context.read(typeOfTherapyProvider).state = null;
    context.read(numberOfTherapiesProvider).state = 0;
    context.read(telephoneNumberProvider).state = 0;
    context.read(patientNameProvider).state = '';
    context.read(patientDiagnosisProvider).state = '';
    context.read(patientIdNumberProvider).state = '';
    context.read(patientAgeProvider).state = 0;
    context.read(addressNumberProvider).state = '';
    Navigator.pushReplacementNamed(context, FormScreen.route);
  }
}
