import '../models/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedDepartmentProvider = StateProvider<Department?>((ref) => null);
final selectedLocalityProvider = StateProvider<Locality?>((ref) => null);
final authotizationDateProvider = StateProvider<DateTime?>((ref) => null);
final patientAgeNumberProvider = StateProvider<int?>((ref) => null);
final typeOfTherapyProvider = StateProvider<Therapy?>((ref) => null);
final preferredScheduleProvider = StateProvider<Schedule?>((ref) => null);
final typeOfIdProvider = StateProvider<TypeOfId?>((ref) => null);
final numberOfTherapiesProvider = StateProvider<int>((ref) => 0);
final patientNameProvider = StateProvider<String>((ref) => '');
final patientDiagnosisProvider = StateProvider<String>((ref) => '');
final patientIdNumberProvider = StateProvider<String>((ref) => '');
final insuranceNameProvider = StateProvider<String>((ref) => '');
final telephoneNumberProvider = StateProvider<String>((ref) => '');
final sessionsNumberProvider = StateProvider<String>((ref) => '');
final patientAgeProvider = StateProvider<String>((ref) => '');
final addressNumberProvider = StateProvider<String>((ref) => '');
