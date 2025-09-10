import 'package:flutter/widgets.dart';

enum ExpencesCategory { food, transport, health, shopping, subscriptions }

final Map<ExpencesCategory, String> expenceCategoryImages = {
  ExpencesCategory.food: "assets/images/restaurant.png",
  ExpencesCategory.transport: "assets/images/car.png",
  ExpencesCategory.health: "assets/images/health.png",
  ExpencesCategory.shopping: "assets/images/bag.png",
  ExpencesCategory.subscriptions: "assets/images/income.png",
};

final Map<ExpencesCategory, Color> expenseCategoryColors = {
  ExpencesCategory.food: const Color(0xFFE57373),
  ExpencesCategory.transport: const Color(0xFF81C784),
  ExpencesCategory.health: const Color(0xFF64B5F6),
  ExpencesCategory.shopping: const Color(0xFFFFD54F),
  ExpencesCategory.subscriptions: const Color(0xFF9575CD),
};

class Expences {
  final int id;
  final String title;
  final double amount;
  final ExpencesCategory category;
  final DateTime date;
  final DateTime time;
  final String description;

  Expences({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    required this.time,
    required this.description,
  });
}
