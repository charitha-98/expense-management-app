import 'package:expenz/constent/colors.dart';
import 'package:expenz/constent/constent.dart';
import 'package:expenz/models/expences_model.dart';
import 'package:expenz/widgets/expenses_card.dart';

import 'package:flutter/material.dart';

class TransactionPage extends StatefulWidget {
  final List<Expences> expensesList;
  final void Function(Expences) onDissmissedExpense;
  const TransactionPage({
    super.key,
    required this.expensesList,
    required this.onDissmissedExpense,
  });

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(kDefalutPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "See your finacial report",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: kMainColor,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Expenses",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kBlack,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: widget.expensesList.length,
                        itemBuilder: (context, index) {
                          final expense = widget.expensesList[index];

                          return Dismissible(
                            key: ValueKey(expense),
                            direction: DismissDirection.startToEnd,
                            onDismissed: (direction) {
                              setState(() {
                                widget.onDissmissedExpense(expense);
                              });
                            },
                            child: ExpensesCard(
                              title: expense.title,
                              date: expense.date,
                              amount: expense.amount,
                              category: expense.category,
                              description: expense.description,
                              time: expense.time,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
