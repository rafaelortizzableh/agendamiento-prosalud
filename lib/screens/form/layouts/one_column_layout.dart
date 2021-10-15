import 'package:flutter/material.dart';
import '../../screens.dart';

class OneColumnLayout extends StatelessWidget {
  const OneColumnLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _oneColumnWidgets.length,
      itemBuilder: (context, index) => _oneColumnWidgets[index],
      separatorBuilder: (context, index) =>
          SizedBox(height: (index == 1 || index == 9) ? 0 : 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      shrinkWrap: true,
    );
  }
}

List<Widget> _oneColumnWidgets = [
  const NameWidget(),
  const TypeOfIdDropdown(),
  const IdNumberWidget(isTwoColumn: false),
  const AgeWidget(),
  const DiagnosisWidget(),
  const TypeOfTherapyDropDown(),
  const AddressWidget(),
  const InsuranceWidget(),
  const TelephoneWidget(),
  const DepartmentDropdown(),
  const LocalityDropdown(isTwoColumn: false),
  const SessionsWidget(),
  const AuthorizationDate(),
  const PreferredScheduleDropdown(),
  const SubmitButton(),
];
