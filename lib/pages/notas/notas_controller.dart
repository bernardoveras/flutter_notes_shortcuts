import 'package:flutter/cupertino.dart';

class NotasController {
  final loading = ValueNotifier<bool>(false);

  final ValueNotifier<List<String>> notas = ValueNotifier<List<String>>([]);

  Future<List<String>> fetch() async {
    try {
      loading.value = true;

      await Future.delayed(const Duration(seconds: 1));

      notas.value = [
        'Aprender JavaScript',
        'Aprender HTML',
        'Aprender CSS',
      ];

      return notas.value;
    } catch (e) {
      throw Exception(e);
    } finally {
      loading.value = false;
    }
  }
}

enum ListState { loading, empty, success, error }
