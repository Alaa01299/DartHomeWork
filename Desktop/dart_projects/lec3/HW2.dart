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
    print("\nلا يمكن سحب مبلغ أكبر من الرصيد.\n");
    return;
  }

  balance -= amount;
  withdrawCount++;
  dailyWithdrawTotal += amount;

  print("\nتم سحب $amount ريال بنجاح.");
  print("رصيدك الحالي: $balance ريال");
  print("عدد السحوبات المتبقية اليوم: ${3 - withdrawCount}\n");
}

void main() {
  while (true) {
    print("PLZ select operation from menu :");
    print("1. Show Balance (عرض الرصيد)");
    print("2. Deposit (إيداع)");
    print("3. Withdraw (سحب)");
    print("4. Exit (خروج)");
    stdout.write("Enter your choice: ");

    String? choice = stdin.readLineSync();

    switch (choice) {
      case "1":
        showBalance();
        break;

      case "2":
        stdout.write("Enter deposit amount: ");
        double amount = double.parse(stdin.readLineSync()!);
        deposit(amount);
        break;

      case "3":
        stdout.write("Enter withdraw amount: ");
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
