import 'package:agendamiento_prosalud/providers/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../screens.dart';

class TwoColumnLayout extends StatefulWidget {
  const TwoColumnLayout({Key? key, required this.constriants})
      : super(key: key);
  final BoxConstraints constriants;

  @override
  _TwoColumnLayoutState createState() => _TwoColumnLayoutState();
}

class _TwoColumnLayoutState extends State<TwoColumnLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.constriants.maxWidth,
      height: widget.constriants.maxHeight,
      color: Theme.of(context).primaryColor,
      child: Center(
        child: AnimatedContainer(
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          duration: Duration(milliseconds: 100),
          width: widget.constriants.maxWidth * 0.9,
          height: widget.constriants.maxHeight * 0.95,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: NameWidget()),
                      SizedBox(width: 8),
                      Expanded(child: AgeWidget())
                    ],
                  ),
                  SizedBox(height: 8),
                  Consumer(builder: (context, watch, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(child: TypeOfIdDropdown()),
                        if (watch(typeOfIdProvider).state != null)
                          Expanded(child: IdNumberWidget(isTwoColumn: true))
                      ],
                    );
                  }),
                  SizedBox(height: 8),
                  DiagnosisWidget(),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TypeOfTherapyDropDown(),
                              SizedBox(height: 8),
                              InsuranceWidget(),
                            ],
                          ),
                        ),
                      ),
                      if (widget.constriants.maxWidth > 800) SizedBox(width: 8),
                      if (widget.constriants.maxWidth > 800)
                        Expanded(
                          child: Image.asset(
                            'assets/images/logo_color.png',
                            height: 150,
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: TelephoneWidget()),
                      SizedBox(width: 8),
                      Expanded(child: AddressWidget()),
                    ],
                  ),
                  SizedBox(height: 8),
                  Consumer(builder: (context, watch, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(child: DepartmentDropdown()),
                        if (watch(selectedDepartmentProvider).state != null)
                          Expanded(child: LocalityDropdown(isTwoColumn: true)),
                      ],
                    );
                  }),
                  SizedBox(height: 8),
                  AuthorizationDate(),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          flex: 2,
                          child: SizedBox(
                              width: 400, child: PreferedScheduleDropdown())),
                      SizedBox(width: 8),
                      Expanded(
                          flex: 1,
                          child: SizedBox(width: 100, child: SessionsWidget())),
                    ],
                  ),
                  SizedBox(height: 8),
                  SubmitButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
