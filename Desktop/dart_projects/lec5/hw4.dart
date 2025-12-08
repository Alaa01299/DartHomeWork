class BankAccount {
  int? _accountNumber;
  String? _accountName;
  double _balance = 0;

  BankAccount(int accountNumber, String accountName, double balance) {
    _accountNumber = accountNumber;
    _accountName = accountName;
    _balance = balance;
  }

  double getBalance() {
    return _balance;
  }

  void updateBalance(double newBalance) {
    _balance = newBalance;
  }

  void printAccountInfo() {
    print(" Bank Account Info ");
    print("Account Number : $_accountNumber");
    print("Account Name : $_accountName");
    print("Balance : $_balance\n");
  }
}

class SavingAccount extends BankAccount {
  final double _interestRate = 0.12;

  SavingAccount(int accNumber, String accName, double balance)
      : super(accNumber, accName, balance);

  double getInterest() {
    return getBalance() * _interestRate;
  }

  void printSavingInfo() {
    print(" Saving Account Info ");
    printAccountInfo();
    print("Interest Rate : ${_interestRate * 100}%");
    print("Interest Value: ${getInterest()}\n");
  }
}

class CheckingAccount extends BankAccount {
  double amount = 0;

  CheckingAccount(int accNumber, String accName, double balance)
      : super(accNumber, accName, balance);

  void deposit(double amount) {
    updateBalance(getBalance() + amount);
  }

  void withdraw(double amount) {
    if (amount > getBalance()) {
      print("Error: Not enough balance!");
    } else {
      updateBalance(getBalance() - amount);
    }
  }

  void printCheckingInfo() {
    print(" Checking Account Info ");
    printAccountInfo();
    print("\n");
  }
}

void main() {
  
  SavingAccount saveAcc = SavingAccount(1, "Ahmed Saving", 1000);

  saveAcc.printSavingInfo();

  CheckingAccount checkAcc = CheckingAccount(2, "Omar Checking", 500);

  checkAcc.printCheckingInfo();


  print("\n Deposit 300 ");
  checkAcc.deposit(300);
  checkAcc.printCheckingInfo();

  print("\n Withdraw 900 ");
  checkAcc.withdraw(900);
  checkAcc.printCheckingInfo();

  print("\n Withdraw 200 ");
  checkAcc.withdraw(200);
  checkAcc.printCheckingInfo();
}
