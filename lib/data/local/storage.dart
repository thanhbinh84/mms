import 'dart:convert';

import 'package:mms/data/models/issue_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

const KEY_VISITED_ISSUES = 'KEY_VISITED_ISSUES';

class Storage {
  static final Storage instance = new Storage._internal();
  SharedPreferences? _prefs;

  factory Storage() {
    return instance;
  }

  Storage._internal();

  Future<void> init() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
  }

  Future<void> saveString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  String getString(String key) {
    return _prefs?.getString(key) ?? '';
  }

  Set<Issue> getVisitedIssues() {
    String json = getString(KEY_VISITED_ISSUES);
    if (json.isEmpty) return Set();
    return (jsonDecode(json) as List<dynamic>).map<Issue>((item) => Issue.fromJson(item)).toList().toSet();
  }

  setVisitedIssues(Set<Issue> issueSet) {
    saveString(
        KEY_VISITED_ISSUES,
        jsonEncode(
          issueSet.map<Map<String, dynamic>>((issue) => issue.toJson()).toList(),
        ));
  }
}
