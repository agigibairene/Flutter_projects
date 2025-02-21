import 'package:flutter/material.dart';
import "../model/transaction.dart";

class TransactionProvider extends ChangeNotifier{
  final List<Transaction> _transactions = [];

  List<Transaction> get transaction => _transactions;

  // Calculating the total income
  double get totalIncome => transaction.where((tx)=> tx.isIncome).fold(0, (sum, tx)=>sum + tx.amount);

  // Calculating the total expenses
  double get totalExpenses => transaction.where((tx)=> !tx.isIncome).fold(0, (sum, tx)=>sum + tx.amount);

  // Calculating the remaining balance 
  double get remainingBalance => totalIncome - totalExpenses;

  // Adding a new transaction
  void addTransaction(Transaction newTransaction){
    _transactions.insert(0, newTransaction);
    notifyListeners();
  }


  // Remove a transaction
  void removeTransaction(String id){
    _transactions.removeWhere((transc) => transc.id == id); 
    notifyListeners();
  }
}
