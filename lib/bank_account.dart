/// Exercise 1: bank accounts.
///
/// Money is in whole rupees, so every amount is an `int`.
/// Read the whole file first. The comments name the idea each part shows.
class BankAccount {
  // TODO 1: Add an initializer list that sets `_balance` from
  // `openingBalance`, and remove the `= 0` from the field below.
  BankAccount(this.owner, {int openingBalance = 0}) : _balance = openingBalance;  

  /// `final`: set once, in the constructor, and never changed.
  final String owner;

  /// Encapsulation: `_balance` is private to this file. Only the methods
  /// below can change it, so the balance can never go wrong.
  int _balance;

  /// A getter: read it like a field, `account.balance`, but nobody can set it.
  int get balance => _balance;

  /// A method that guards the data: it refuses a bad amount.
  bool deposit(int amount) {
    if (amount <= 0) {
      return false;
    } 
    _balance += amount;
    return true;
  }

  bool withdraw(int amount) {
    if (amount <= 0 || amount > _balance) {
      return false;
    }
    _balance -= amount;
    return true;
  }

  /// `print(account)` uses this. `@override` says it replaces Object's.
  @override
  String toString() => '$owner: Rs $_balance';
}

/// Inheritance: a SavingsAccount is a BankAccount with two extra rules.
class SavingsAccount extends BankAccount {
  /// `super.owner` and `super.openingBalance` pass the values up to
  /// BankAccount's constructor. `this.interestPercent = 5` is a default.
  SavingsAccount(super.owner, {super.openingBalance, this.interestPercent = 5});

  final int interestPercent;

  /// `static const`: one value shared by every SavingsAccount.
  static const int minimumBalance = 1000;

  /// `~/` keeps the result a whole number of rupees.
  void addInterest() {
    deposit(balance * interestPercent ~/ 100);
  }

  // TODO 2: Override withdraw. If the balance after the withdrawal would be
  // below minimumBalance, return false. Otherwise use BankAccount's withdraw
  // (call it with `super.`).
@override
bool withdraw(int amount) {
  if (balance - amount < minimumBalance) {
    return false;
  }
  return super.withdraw(amount);
}
  /// Polymorphism: `print` on a SavingsAccount runs this version.
  @override
  String toString() => '${super.toString()} (savings, $interestPercent%)';
}
