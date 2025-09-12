import 'dart:convert';

import 'package:expenz/models/income_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IncomeService {
  static final String _incomeKey = "income";

  Future<void> saveIncome(Income income, BuildContext context) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();

      List<String>? existingIncome = preferences.getStringList(_incomeKey);

      List<Income> existingIncomeObjects = [];

      if (existingIncome != null) {
        existingIncomeObjects = existingIncome
            .map((e) => Income.fromJSON(json.decode(e)))
            .toList();
      }
      existingIncomeObjects.add(income);

      List<String> updatedIncome = existingIncomeObjects
          .map((e) => json.encode(e.toJSON()))
          .toList();

      await preferences.setStringList(_incomeKey, updatedIncome);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Income added succesfully"),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Income added Error!"),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  Future<List<Income>> loadIncomes() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    List<String>? existingIncome = preferences.getStringList(_incomeKey);

    List<Income> loadedIncomes = [];

    if (existingIncome != null) {
      loadedIncomes = existingIncome
          .map((e) => Income.fromJSON(json.decode(e)))
          .toList();
    }
    return loadedIncomes;
  }
}
