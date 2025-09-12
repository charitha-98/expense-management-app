import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

enum IncomeCategory { salary, freelance, passiveincome, sales }

// category images

final Map<IncomeCategory, String> incomeCategoryImages = {
  IncomeCategory.freelance: "assets/images/freelance.png",
  IncomeCategory.salary: "assets/images/health.png",
  IncomeCategory.passiveincome: "assets/images/car.png",
  IncomeCategory.sales: "assets/images/income.png",
};

// category colors

final Map<IncomeCategory, Color> incomeCategoryColor = {
  IncomeCategory.freelance: const Color(0xFFE57373),
  IncomeCategory.passiveincome: const Color(0xFF81C784),
  IncomeCategory.sales: const Color(0xFF64B5F6),
  IncomeCategory.salary: const Color(0xFFFFD54F),
};

class Income {
  final int id;
  final String title;
  final double amount;
  final IncomeCategory category;
  final DateTime date;
  final DateTime time;
  final String description;

  Income({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    required this.time,
    required this.description,
  });

  // convert to jason object

  Map<String, dynamic> toJSON() {
    return {
      "id": id,
      "title": title,
      "amount": amount,
      "category": category.index,
      "date": date.toIso8601String(),
      "time": time.toIso8601String(),
      "description": description,
    };
  }

  // convert to dart object

  factory Income.fromJSON(Map<String, dynamic> json) {
    return Income(
      id: json["id"],
      title: json["title"],
      amount: json["amount"],
      category: IncomeCategory.values[json["category"]],
      date: DateTime.parse(json["date"]),
      time: DateTime.parse(json["time"]),
      description: json["description"],
    );
  }
}
