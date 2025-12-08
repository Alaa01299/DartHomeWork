import 'dart:io';

double balance = 100000;
int withdrawCount = 0; 
double dailyWithdrawTotal = 0;

void showBalance() {
  print("\c current balance is: $balance \n");
}

void deposit(double amount) {
  if (amount > 0) {
    balance += amount;
    print("\n you deposited: $amount");
    print("current balance: $balance \n");
  } else {
    print("\n invalid \n");
  }
}

void withdraw(double amount) {
  if (withdrawCount >= 3) {
    print("\n you can only withdrow 3 times per day \n");
    return;
  }

  if (amount > 50000) {
    print("\n you can't withdrow more than 50000\n");
    return;
  }

  if (dailyWithdrawTotal + amount > 120000) {
    print("\n you can't withdrow more than 50000\n");
    return;
  }

  if (amount > balance) {
    print("\n you can't withdrow more than your balance\n");
    return;
  }

  balance -= amount;
  withdrawCount++;
  dailyWithdrawTotal += amount;

  print("\n you withdrowed $amount .");
  print(" : your balance $balance ");
  print(" you have : ${3 - withdrawCount} times to withdrow\n");
}

void main() {
  while (true) {
    print("choose operation :");
    print("1- Show Balance");
    print("2- Deposit ");
    print("3- Withdraw ");
    print("4- Exit ");
    print("Enter your choice: ");

    String? choice = stdin.readLineSync();

    switch (choice) {
      case "1":
        showBalance();
        break;

      case "2":
        print("Enter deposit amount: ");
        double amount = double.parse(stdin.readLineSync()!);
        deposit(amount);
        break;

      case "3":
        print("Enter withdraw amount: ");
        double amount = double.parse(stdin.readLineSync()!);
        withdraw(amount);
        break;

      case "4":
        print("\n exiting\n");
        return;

      default:
        print("\n invalid choice\n");
    }
  }
}
