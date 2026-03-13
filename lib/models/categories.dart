import 'dart:convert';

List<String> categoriesFromJson(String str) => List<String>.from(json.decode(str).map((x) => x));

