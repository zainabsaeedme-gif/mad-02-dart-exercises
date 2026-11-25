import 'package:dart_exercises/bank_account.dart';
import 'package:dart_exercises/grade_book.dart';

void main() {
  print('Exercise 1: bank accounts');
  List<BankAccount> accounts = [
    BankAccount('Ali', openingBalance: 1500),
    SavingsAccount('Fatima', openingBalance: 1500),
  ];
  for (var account in accounts) {
    print(account);
  }
  for (var account in accounts) {
    print('${account.owner} withdraws Rs 600: ${account.withdraw(600)}');
  }
  for (var account in accounts) {
    if (account is SavingsAccount) {
      account.addInterest();
      print('After interest: $account');
    }
  }

  print('');
  print('Exercise 2: grade book');
  var book = GradeBook();
  book.addStudent('Ali');
  book.addStudent('Fatima');
  book.addStudent('Zain');
  for (var mark in [78, 91, 64]) {
    book.addMark('Ali', mark);
  }
  for (var mark in [95, 87]) {
    book.addMark('Fatima', mark);
  }
  print(book.report());
}
