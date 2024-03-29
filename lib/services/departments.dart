import '../models/models.dart';

const List<Map<String, Object>> departmentJson = [
  {"name": "SANTANDER", "id": 68},
  {"name": "AMAZONAS", "id": 91},
  {"name": "ANTIOQUIA", "id": 5},
  {"name": "ARAUCA", "id": 81},
  {"name": "ATLÁNTICO", "id": 8},
  {"name": "BOGOTÁ", "id": 11},
  {"name": "BOLÍVAR", "id": 13},
  {"name": "BOYACÁ", "id": 15},
  {"name": "CALDAS", "id": 17},
  {"name": "CAQUETÁ", "id": 18},
  {"name": "CASANARE", "id": 85},
  {"name": "CAUCA", "id": 19},
  {"name": "CESAR", "id": 20},
  {"name": "CHOCÓ", "id": 27},
  {"name": "CÓRDOBA", "id": 23},
  {"name": "CUNDINAMARCA", "id": 25},
  {"name": "GUAINÍA", "id": 94},
  {"name": "GUAVIARE", "id": 95},
  {"name": "HUILA", "id": 41},
  {"name": "LA GUAJIRA", "id": 44},
  {"name": "MAGDALENA", "id": 47},
  {"name": "META", "id": 50},
  {"name": "NARIÑO", "id": 52},
  {"name": "NORTE DE SANTANDER", "id": 54},
  {"name": "PUTUMAYO", "id": 86},
  {"name": "QUINDÍO", "id": 63},
  {"name": "RISARALDA", "id": 66},
  {"name": "SAN ANDRÉS", "id": 88},
  {"name": "SUCRE", "id": 70},
  {"name": "TOLIMA", "id": 73},
  {"name": "VALLE DEL CAUCA", "id": 76},
  {"name": "VAUPÉS", "id": 97},
  {"name": "VICHADA", "id": 99}
];

final List<Department> departments =
    departmentJson.map((e) => Department.fromMap(e)).toList();
