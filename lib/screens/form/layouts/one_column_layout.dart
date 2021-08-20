import 'package:flutter/material.dart';
import '../../screens.dart';

class OneColumnLayout extends StatelessWidget {
  const OneColumnLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NameWidget(),
            SizedBox(height: 16),
            TypeOfIdDropdown(),
            IdNumberWidget(
              isTwoColumn: false,
            ),
            SizedBox(height: 16),
            AgeWidget(),
            SizedBox(height: 16),
            DiagnosisWidget(),
            SizedBox(height: 16),
            TypeOfTherapyDropDown(),
            SizedBox(height: 16),
            AddressWidget(),
            SizedBox(height: 16),
            InsuranceWidget(),
            SizedBox(height: 16),
            TelephoneWidget(),
            SizedBox(height: 16),
            DepartmentDropdown(),
            LocalityDropdown(
              isTwoColumn: false,
            ),
            SizedBox(height: 16),
            SessionsWidget(),
            SizedBox(height: 16),
            AuthorizationDate(),
            SizedBox(height: 16),
            PreferedScheduleDropdown(),
            SizedBox(height: 16),
            SubmitButton(),
          ],
        ),
      ),
    );
  }
}
