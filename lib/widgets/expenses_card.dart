// ignore_for_file: deprecated_member_use

import 'package:expenz/constent/colors.dart';
import 'package:expenz/models/expences_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpensesCard extends StatelessWidget {
  final String title;
  final DateTime date;
  final double amount;
  final ExpencesCategory category;
  final String description;
  final DateTime time;
  const ExpensesCard({
    super.key,
    required this.title,
    required this.date,
    required this.amount,
    required this.category,
    required this.description,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: kGrey.withOpacity(0.4),
            spreadRadius: 1,
            offset: Offset(0, 1),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: expenseCategoryColors[category]!.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset(
              expenceCategoryImages[category]!,
              width: 20,
              height: 20,
            ),
          ),
          SizedBox(width: 25),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: kBlack,
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: kGrey,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "-\$${amount.toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kRed,
                ),
              ),
              Text(
                DateFormat.jm().format(date),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: kGrey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
