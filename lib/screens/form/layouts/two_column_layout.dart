import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../screens.dart';
import '../../../providers/providers.dart';

class TwoColumnLayout extends StatefulWidget {
  const TwoColumnLayout({Key? key, required this.constriants})
      : super(key: key);
  final BoxConstraints constriants;

  @override
  State<TwoColumnLayout> createState() => _TwoColumnLayoutState();
}

class _TwoColumnLayoutState extends State<TwoColumnLayout> {
  static const _verticalPaddindSmall = 10.0;
  static const _maxWhiteContainerWidth = 1280.0;
  static const _maxWhiteContainerHeight = 720.0;
  final double _verticalPadding = _verticalPaddindSmall;

  @override
  Widget build(BuildContext context) {
    final maxWidth = widget.constriants.maxWidth;
    final maxHeight = widget.constriants.maxHeight;
    return Container(
      width: maxWidth,
      height: maxHeight,
      color: Theme.of(context).primaryColor,
      child: Center(
        child: AnimatedContainer(
          constraints: const BoxConstraints(
              maxHeight: _maxWhiteContainerHeight,
              maxWidth: _maxWhiteContainerWidth),
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          duration: const Duration(milliseconds: 10),
          width: maxWidth * 0.9,
          height: maxHeight * 0.95,
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
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(child: NameWidget()),
                          SizedBox(width: 8),
                          Expanded(child: AgeWidget())
                        ],
                      ),
                      SizedBox(height: _verticalPadding),
                      Consumer(builder: (context, ref, _) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Expanded(child: TypeOfIdDropdown()),
                            if (ref.watch(typeOfIdProvider) != null)
                              const Expanded(
                                child: IdNumberWidget(isTwoColumn: true),
                              ),
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const TypeOfTherapyDropDown(),
                                SizedBox(height: _verticalPadding),
                                const InsuranceWidget(),
                              ],
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
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(child: TelephoneWidget()),
                          SizedBox(width: 8),
                          Expanded(child: AddressWidget()),
                        ],
                      ),
                      SizedBox(height: _verticalPadding),
                      Consumer(builder: (context, ref, _) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Expanded(child: DepartmentDropdown()),
                            if (ref.watch(selectedDepartmentProvider) != null)
                              const Expanded(
                                  child: LocalityDropdown(isTwoColumn: true)),
                          ],
                        );
                      }),
                      SizedBox(height: _verticalPadding),
                      const AuthorizationDate(),
                      SizedBox(height: _verticalPadding),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              flex: 2,
                              child: SizedBox(
                                  width: 400,
                                  child: PreferredScheduleDropdown())),
                          SizedBox(width: 8),
                          Expanded(
                              flex: 1,
                              child: SizedBox(
                                  width: 100, child: SessionsWidget())),
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
