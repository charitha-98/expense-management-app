import 'dart:convert';

import 'package:expenz/models/expences_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExpenceService {
  // expence list

  List<Expences> expnecesList = [];

  static String _expenceKey = "expences";

  Future<void> saveExpenses(Expences expences, BuildContext context) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      List<String>? existingExpenses = preferences.getStringList(_expenceKey);

      List<Expences> exisitngExpensesObjects = [];

      if (existingExpenses != null) {
        exisitngExpensesObjects = existingExpenses
            .map((e) => Expences.fromJSON(json.decode(e)))
            .toList();
      }

      exisitngExpensesObjects.add(expences);

      List<String> updatedExpenses = exisitngExpensesObjects
          .map((e) => json.encode(e.toJSON()))
          .toList();

      await preferences.setStringList(_expenceKey, updatedExpenses);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Expenses added successfully"),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error adding expences!"),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  Future<List<Expences>> loadExpenses() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String>? existingExpenses = preferences.getStringList(_expenceKey);

    List<Expences> loadExpenses = [];
    if (existingExpenses != null) {
      loadExpenses = existingExpenses
          .map((e) => Expences.fromJSON(json.decode(e)))
          .toList();
    }
    return loadExpenses;
  }
}
