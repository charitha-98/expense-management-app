import 'package:expenz/constent/colors.dart';
import 'package:expenz/models/expences_model.dart';
import 'package:expenz/models/income_model.dart';
import 'package:expenz/screens/add_new_page.dart';
import 'package:expenz/screens/budget_page.dart';
import 'package:expenz/screens/home_page.dart';
import 'package:expenz/screens/profile_page.dart';
import 'package:expenz/screens/transaction_page.dart';
import 'package:expenz/services/expence_service.dart';
import 'package:expenz/services/income_service.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentPageIndex = 0;
  List<Expences> expenseList = [];
  List<Income> incomeList = [];
  //
  void fetchAllExpenses() async {
    List<Expences> loadedExpenses = await ExpenceService().loadExpenses();
    setState(() {
      expenseList = loadedExpenses;
    });
  }

  void addNewExpenses(Expences newExpenses) {
    ExpenceService().saveExpenses(newExpenses, context);

    setState(() {
      expenseList.add(newExpenses);
    });
  }

  void fetchAllIncomes() async {
    List<Income> loadedIncomes = await IncomeService().loadIncomes();
    setState(() {
      incomeList = loadedIncomes;
    });
  }

  void addNewIncomes(Income newIncome) {
    IncomeService().saveIncome(newIncome, context);
    setState(() {
      incomeList.add(newIncome);
    });
  }

  void removeExpenses(Expences expenses) {
    ExpenceService().deleteExpense(expenses.id, context);
    setState(() {
      expenseList.remove(expenses);
    });
  }

  void removeIncome(Income income) {
    IncomeService().deleteIncome(income.id, context);
    setState(() {
      incomeList.remove(income);
    });
  }

  @override
  void initState() {
    setState(() {
      fetchAllExpenses();
      fetchAllIncomes();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      TransactionPage(
        expensesList: expenseList,
        incomeList: incomeList,
        onDissmissedExpense: removeExpenses,
        onDissmissedIncome: removeIncome,
      ),
      HomePage(),

      AddNewPage(addExpences: addNewExpenses, addIncomes: addNewIncomes),
      BudgetPage(),
      ProfilePage(),
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: kWhite,
        selectedItemColor: kMainColor,
        unselectedItemColor: kGrey,
        currentIndex: _currentPageIndex,
        onTap: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_rounded),
            label: "Transactions",
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: kMainColor,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.add, color: kWhite, size: 30),
            ),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.rocket), label: "Budget"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: pages[_currentPageIndex],
    );
  }
}
