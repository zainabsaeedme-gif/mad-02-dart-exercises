import 'package:dart_exercises/bank_account.dart';
import 'package:test/test.dart';

void main() {
  test('A new account starts with its opening balance', () {
    expect(BankAccount('Ali', openingBalance: 500).balance, 500);
  });

  test('A new account without an opening balance starts at 0', () {
    expect(BankAccount('Ali').balance, 0);
  });

  test('deposit adds the amount and returns true', () {
    var account = BankAccount('Ali');
    expect(account.deposit(250), isTrue);
    expect(account.balance, 250);
  });

  test('deposit refuses zero and negative amounts', () {
    var account = BankAccount('Ali');
    account.deposit(500);
    expect(account.deposit(0), isFalse);
    expect(account.deposit(-100), isFalse);
    expect(account.balance, 500);
  });

  test('withdraw takes the amount and returns true', () {
    var account = BankAccount('Ali');
    account.deposit(500);
    expect(account.withdraw(200), isTrue);
    expect(account.balance, 300);
  });

  test('withdraw refuses more than the balance, zero and negative amounts', () {
    var account = BankAccount('Ali');
    account.deposit(500);
    expect(account.withdraw(600), isFalse);
    expect(account.withdraw(0), isFalse);
    expect(account.withdraw(-50), isFalse);
    expect(account.balance, 500);
  });

  test('toString shows the owner and the balance', () {
    var account = BankAccount('Ali');
    account.deposit(1500);
    expect(account.toString(), 'Ali: Rs 1500');
  });

  test('addInterest adds interestPercent of the balance', () {
    var account = SavingsAccount('Fatima');
    account.deposit(10000);
    account.addInterest();
    expect(account.balance, 10500);
    var account2 = SavingsAccount('Zain', interestPercent: 10);
    account2.deposit(10000);
    account2.addInterest();
    expect(account2.balance, 11000);
  });

  test('A savings account keeps the minimum balance', () {
    var account = SavingsAccount('Fatima');
    account.deposit(1500);
    expect(account.withdraw(600), isFalse);
    expect(account.balance, 1500);
    expect(account.withdraw(500), isTrue);
    expect(account.balance, 1000);
  });

  test('In a list of accounts, each account uses its own withdraw', () {
    List<BankAccount> accounts = [BankAccount('Ali'), SavingsAccount('Fatima')];
    var results = <bool>[];
    for (var account in accounts) {
      account.deposit(1500);
      results.add(account.withdraw(600));
    }
    expect(results, [true, false]);
  });
}
