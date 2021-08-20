import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/providers.dart';

class TelephoneWidget extends StatefulWidget {
  const TelephoneWidget({Key? key}) : super(key: key);

  @override
  _TelephoneWidgetState createState() => _TelephoneWidgetState();
}

class _TelephoneWidgetState extends State<TelephoneWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    if (context.read(telephoneNumberProvider).state != 0) {
      _controller = TextEditingController.fromValue(TextEditingValue(
          text: context.read(telephoneNumberProvider).state.toString()));
    } else {
      _controller = TextEditingController();
    }

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      onChanged: (value) {
        if (value.isNotEmpty) {
          context.read(telephoneNumberProvider).state = int.parse(value);
        } else {
          context.read(telephoneNumberProvider).state = 0;
        }

        String departmentName =
            context.read(selectedDepartmentProvider).state?.name ?? '';
        String localityName =
            context.read(selectedLocalityProvider).state?.name ?? '';
        DateTime? authorizationDate =
            context.read(authotizationDateProvider).state ?? null;

        String typeOfTherapy =
            context.read(typeOfTherapyProvider).state?.therapyName ?? '';
        String scheduleTime =
            context.read(preferredScheduleProvider).state?.time ?? '';
        String typeOfId = context.read(typeOfIdProvider).state?.type ?? '';
        int numberOfTherapies = context.read(numberOfTherapiesProvider).state;
        int telephone = context.read(telephoneNumberProvider).state;
        String name = context.read(patientNameProvider).state.trim();
        String diagnosis = context.read(patientDiagnosisProvider).state.trim();
        String idNumber = context.read(patientIdNumberProvider).state.trim();
        String insuranceCompany =
            context.read(insuranceNameProvider).state?.name ?? '';
        int age = context.read(patientAgeProvider).state;
        String address = context.read(addressNumberProvider).state.trim();
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
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) =>
          value != null && value.length > 10 ? 'Máximo 10 caracteres' : null,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        labelText: 'Teléfono del paciente',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }
}
