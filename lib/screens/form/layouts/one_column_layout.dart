import 'package:flutter/material.dart';
import '../../screens.dart';

class OneColumnLayout extends StatelessWidget {
  const OneColumnLayout({
    Key? key,
  }) : super(key: key);
  static const _padding12 = 12.0;
  static const _padding0 = 0.0;
  static const _zeroValue = 0;
  static const _oneValue = 1;
  static const _nineValue = 9;
  static const _fourteenValue = 14;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Padding(
                padding: EdgeInsets.fromLTRB(
                  _padding12,
                  (index == _zeroValue || index == _fourteenValue)
                      ? _padding12
                      : _padding0,
                  _padding12,
                  (index == _oneValue || index == _nineValue)
                      ? _padding0
                      : _padding12,
                ),
                child: _oneColumnWidgets[index]),
            childCount: _oneColumnWidgets.length,
          ),
        ),
      ],
    );
  }
}

const List<Widget> _oneColumnWidgets = const [
  NameWidget(),
  TypeOfIdDropdown(),
  IdNumberWidget(isTwoColumn: false),
  AgeWidget(),
  DiagnosisWidget(),
  TypeOfTherapyDropDown(),
  AddressWidget(),
  InsuranceWidget(),
  TelephoneWidget(),
  DepartmentDropdown(),
  LocalityDropdown(isTwoColumn: false),
  SessionsWidget(),
  AuthorizationDate(),
  PreferredScheduleDropdown(),
  SubmitButton(),
];
