import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();
var format = DateFormat.yMd();

enum Category{
  food, utilities, academics, miscellaneous
}

class ExpenseModel {
  String expense;
  double amount;
  Category category;
  DateTime dateSelected;
  String uniqueId;

  ExpenseModel({
    required this.expense, 
    required this.amount, 
    required this.category,
    required this.dateSelected
  }) : uniqueId = uuid.v4();

  
}