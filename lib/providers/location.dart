import '../models/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedDepartmentProvider = StateProvider<Department?>((ref) => null);
final selectedLocalityProvider = StateProvider<Locality?>((ref) => null);
