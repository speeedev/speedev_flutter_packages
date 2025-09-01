import 'dart:convert';

extension SDJsonStringExtension on String {
  Map<String, dynamic> toJson() {
    try {
      return jsonDecode(this) as Map<String, dynamic>;
    } catch (e) {
      throw FormatException('Invalid JSON string: $this');
    }
  }
}

extension SDJsonMapExtension on Map<String, dynamic> {
  String fromJson() {
    try {
      return jsonEncode(this);
    } catch (e) {
      throw FormatException('Failed to convert map to JSON: $this');
    }
  }
}