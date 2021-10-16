import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../screens.dart';
import '../../../providers/providers.dart';

class TwoColumnLayout extends StatefulWidget {
  const TwoColumnLayout({Key? key, required this.constriants})
      : super(key: key);
  final BoxConstraints constriants;

  @override
  _TwoColumnLayoutState createState() => _TwoColumnLayoutState();
}

class _TwoColumnLayoutState extends State<TwoColumnLayout> {
  static const _verticalPaddindSmall = 10.0;
  static const _maxWhiteContainerWidth = 1280.0;
  static const _maxWhiteContainerHeight = 720.0;
  double _verticalPadding = _verticalPaddindSmall;

  @override
  Widget build(BuildContext context) {
    final _maxWidth = widget.constriants.maxWidth;
    final _maxHeight = widget.constriants.maxHeight;
    return Container(
      width: _maxWidth,
      height: _maxHeight,
      color: Theme.of(context).primaryColor,
      child: Center(
        child: AnimatedContainer(
          constraints: BoxConstraints(
              maxHeight: _maxWhiteContainerHeight,
              maxWidth: _maxWhiteContainerWidth),
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          duration: const Duration(milliseconds: 100),
          width: _maxWidth * 0.9,
          height: _maxHeight * 0.95,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: _verticalPadding),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(child: const NameWidget()),
                          const SizedBox(width: 8),
                          Expanded(child: const AgeWidget())
                        ],
                      ),
                      SizedBox(height: _verticalPadding),
                      Consumer(builder: (context, watch, _) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(child: const TypeOfIdDropdown()),
                            if (watch(typeOfIdProvider).state != null)
                              Expanded(
                                  child:
                                      const IdNumberWidget(isTwoColumn: true))
                          ],
                        );
                      }),
                      SizedBox(height: _verticalPadding),
                      const DiagnosisWidget(),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const TypeOfTherapyDropDown(),
                                  SizedBox(height: _verticalPadding),
                                  const InsuranceWidget(),
                                ],
                              ),
                            ),
                          ),
                          if (widget.constriants.maxWidth > 800)
                            const SizedBox(width: 8),
                          if (widget.constriants.maxWidth > 800)
                            Expanded(
                              child: Image.asset(
                                'assets/images/logo_color.png',
                                height: 150,
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(child: const TelephoneWidget()),
                          const SizedBox(width: 8),
                          Expanded(child: const AddressWidget()),
                        ],
                      ),
                      SizedBox(height: _verticalPadding),
                      Consumer(builder: (context, watch, _) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(child: const DepartmentDropdown()),
                            if (watch(selectedDepartmentProvider).state != null)
                              Expanded(
                                  child: const LocalityDropdown(
                                      isTwoColumn: true)),
                          ],
                        );
                      }),
                      SizedBox(height: _verticalPadding),
                      const AuthorizationDate(),
                      SizedBox(height: _verticalPadding),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              flex: 2,
                              child: const SizedBox(
                                  width: 400,
                                  child: const PreferredScheduleDropdown())),
                          const SizedBox(width: 8),
                          Expanded(
                              flex: 1,
                              child: SizedBox(
                                  width: 100, child: const SessionsWidget())),
                        ],
                      ),
                      SizedBox(height: _verticalPadding),
                      const SubmitButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
