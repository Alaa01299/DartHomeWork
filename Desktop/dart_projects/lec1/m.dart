import 'dart:io';

void main() {
  print("Choose a program to run:");
  print("1 - Calculate discount");
  print("2 - Check even/odd number");
  print("3 - Check age >= 18");
  print("4 - Food order");
  print("5 - Password validation");
  print("6 - Education level");
  print("7 - Month name");
  print("8 - Weather condition");
  print("9 - Calculator (+, -, *, /)");
  print("10 - Seasons (Winter/Spring/Summer/Autumn)");
  print("11 - Student Result Report");
  print("12 - Zakah Calculation");
  print("13 - Net Salary Calculation");
  print("14 - Purchase Invoice");

  stdout.write("Enter your choice (1-14): ");
  String? choiceInput = stdin.readLineSync();
  int? choice = int.tryParse(choiceInput ?? '');

  if (choice == null) {
    print("Invalid choice!");
    return;
  }

  switch (choice) {
    case 1:
      // الخصم
      stdout.write("Enter the price: ");
      double price = double.parse(stdin.readLineSync()!);
      double discount = 0;
      if (price >= 10000) {
        discount = price * 0.12;
      } else if (price >= 5000) {
        discount = price * 0.07;
      }
      double totalPrice = price - discount;
      print("Price = $price\nDiscount = $discount\nTotal Price = $totalPrice");
      break;

    case 2:
      // زوجي أو فردي
      stdout.write("Enter the number: ");
      int number = int.parse(stdin.readLineSync()!);
      print(number.isEven ? '$number is even.' : '$number is odd.');
      break;

    case 3:
      // العمر
      stdout.write("Enter your age: ");
      String? input = stdin.readLineSync();
      if (input != null && int.tryParse(input) != null) {
        int age = int.parse(input);
        print(age >= 18 ? "You are 18 or older." : "You are younger than 18.");
      }
      break;

    case 4:
      // الطعام
      stdout.write("Enter your food order (Pizza/Burger/Shawarma): ");
      String order = stdin.readLineSync()!;
      if (order == "Pizza") {
        print("You ordered a Pizza. Enjoy your cheesy delight!");
      } else if (order == "Burger") {
        print("You ordered a Burger. A classic choice!");
      } else if (order == "Shawarma") {
        print("You ordered a Shawarma. A delicious wrap awaits!");
      } else {
        print("You ordered something else");
      }
      break;

    case 5:
      // كلمة المرور
      stdout.write("Enter your password: ");
      String? password = stdin.readLineSync();
      if (password == null) {
        print("No password entered!");
        return;
      }
      bool hasUpper = false, hasLower = false, hasDigit = false, hasSpecial = false;
      bool hasMinLength = password.length >= 8;
      for (int i = 0; i < password.length; i++) {
        String ch = password[i];
        if (ch.contains(RegExp(r'[A-Z]'))) hasUpper = true;
        else if (ch.contains(RegExp(r'[a-z]'))) hasLower = true;
        else if (ch.contains(RegExp(r'[0-9]'))) hasDigit = true;
        else if (ch.contains(RegExp(r'[@$!%*?&]'))) hasSpecial = true;
      }
      if (hasUpper && hasLower && hasDigit && hasSpecial && hasMinLength) {
        print("Password is valid!");
      } else {
        print("Password is invalid. It must contain:");
        if (!hasUpper) print("- At least one uppercase letter");
        if (!hasLower) print("- At least one lowercase letter");
        if (!hasDigit) print("- At least one digit");
        if (!hasSpecial) print("- At least one special character (@\$!%*?&)");
        if (!hasMinLength) print("- Minimum length of 8 characters");
      }
      break;

    case 6:
      // المؤهل
      stdout.write("Enter your education level (High School/Bachelor/Master/Doctorate): ");
      String levelEducation = stdin.readLineSync()!;
      switch (levelEducation) {
        case "High School": print("You have completed High School."); break;
        case "Bachelor": print("You have a Bachelor's degree."); break;
        case "Master": print("You have a Master's degree."); break;
        case "Doctorate": print("You have a Doctorate degree."); break;
        default: print("Unknown education level.");
      }
      break;

    case 7:
      // الشهور
      stdout.write("Enter month number (1-12): ");
      int monthNumber = int.parse(stdin.readLineSync()!);
      switch (monthNumber) {
        case 1: print("January"); break;
        case 2: print("February"); break;
        case 3: print("March"); break;
        case 4: print("April"); break;
        case 5: print("May"); break;
        case 6: print("June"); break;
        case 7: print("July"); break;
        case 8: print("August"); break;
        case 9: print("September"); break;
        case 10: print("October"); break;
        case 11: print("November"); break;
        case 12: print("December"); break;
        default: print("Invalid month number.");
      }
      break;

    case 8:
      // الطقس
      stdout.write("Enter weather condition (Sunny/Rainy/Cloudy/Snowy/Windy): ");
      String weatherCondition = stdin.readLineSync()!;
      switch (weatherCondition) {
        case "Sunny": print("It's a beautiful day! Don't forget your sunglasses."); break;
        case "Rainy": print("Grab an umbrella and a raincoat. It's raining!"); break;
        case "Cloudy": print("The sky is a bit gray today, but it might clear up."); break;
        case "Snowy": print("Bundle up! It's snowing outside."); break;
        case "Windy": print("Hold onto your hats, it's quite windy!"); break;
        default: print("Weather condition unknown.");
      }
      break;

    case 9:
      // العمليات الحسابية
      stdout.write('Enter the first number: ');
      double num1 = double.parse(stdin.readLineSync()!);
      stdout.write('Enter the operation (+, -, *, /): ');
      String operation = stdin.readLineSync()!;
      stdout.write('Enter the second number: ');
      double num2 = double.parse(stdin.readLineSync()!);
      switch (operation) {
        case '+': print('Result: $num1 + $num2 = ${num1 + num2}'); break;
        case '-': print('Result: $num1 - $num2 = ${num1 - num2}'); break;
        case '*': print('Result: $num1 * $num2 = ${num1 * num2}'); break;
        case '/': 
          if (num2 != 0) print('Result: $num1 / $num2 = ${num1 / num2}');
          else print('Error: Division by zero.');
          break;
        default: print('Invalid operation.');
      }
      break;

    case 10:
      // الفصول
      stdout.write('Enter the month number (1-12): ');
      String? userInput = stdin.readLineSync();
      if (userInput != null) {
        try {
          int monthNumber = int.parse(userInput);
          switch (monthNumber) {
            case 12: case 1: case 2: print('Winter'); break;
            case 3: case 4: case 5: print('Spring'); break;
            case 6: case 7: case 8: print('Summer'); break;
            case 9: case 10: case 11: print('Autumn'); break;
            default: print('Invalid month.');
          }
        } catch (e) {
          print('Invalid input. Please enter a valid number.');
        }
      } else {
        print('No input provided.');
      }
      break;

    case 11:
      // الدرجات
      const int passingGrade = 50;
      const int numberOfSubjects = 3;
      List<String> subjects = [];
      List<int> grades = [];
      bool allPassed = true;

      for (int i = 1; i <= numberOfSubjects; i++) {
        stdout.write('Enter subject $i name: ');
        String? subjectName = stdin.readLineSync();
        if (subjectName == null || subjectName.isEmpty) subjectName = 'Subject $i';
        subjects.add(subjectName);

        int? grade;
        do {
          stdout.write('Enter grade for $subjectName (0-100): ');
          String? input = stdin.readLineSync();
          grade = int.tryParse(input ?? '');
          if (grade == null || grade < 0 || grade > 100) {
            print('Invalid grade. Please enter a value between 0 and 100.');
          }
        } while (grade == null || grade < 0 || grade > 100);

        grades.add(grade);
        if (grade < passingGrade) allPassed = false;
      }

      int totalGrades = grades.reduce((a, b) => a + b);
      double averageGrades = totalGrades / numberOfSubjects;
      String studentResult = allPassed ? 'Pass' : 'Fail';

      print('\n--- Student Result Report ---');
      for (int i = 0; i < numberOfSubjects; i++) {
        print('${subjects[i]}: ${grades[i]}');
      }
      print('Total Grades: $totalGrades');
      print('Average Grade: ${averageGrades.toStringAsFixed(2)}');
      print('Result: $studentResult');
      print('-----------------------------');
      break;

    case 12:
      // الزكاة
      const double nisab = 955000.0;
      const int minimumMonths = 12;
      const double zakatRate = 0.025;

      stdout.write('Enter the financial amount: ');
      double? financialAmount = double.tryParse(stdin.readLineSync() ?? '');

      stdout.write('Enter the number of months: ');
      int? months = int.tryParse(stdin.readLineSync() ?? '');

      if (financialAmount != null && months != null) {
        if (financialAmount >= nisab && months >= minimumMonths) {
          double dueZakat = financialAmount * zakatRate;
          double remainingAmount = financialAmount - dueZakat;
          print('Your Zakat is: ${dueZakat.toStringAsFixed(2)}');
          print('Remaining amount: ${remainingAmount.toStringAsFixed(2)}');
        } else {
          print('Zakah No');
        }
      } else {
        print('Invalid input. Please enter valid numbers.');
      }
      break;

    case 13:
      // صافي الراتب
      print("Enter the basic salary: ");
      double basicSalary = double.tryParse(stdin.readLineSync() ?? '0') ?? 0;

      print("Enter the number of overtime hours: ");
      double overtimeHours = double.tryParse(stdin.readLineSync() ?? '0') ?? 0;

      double hourlyWage = basicSalary * 0.012;
      double overtimeValue = hourlyWage * overtimeHours;
      double netSalary = basicSalary + overtimeValue;

      print("\n--- Salary Calculation Summary ---");
      print("Hourly wage: \$${hourlyWage.toStringAsFixed(2)}");
      print("Basic Salary: \$${basicSalary.toStringAsFixed(2)}");
      print("Value of overtime hours: \$${overtimeValue.toStringAsFixed(2)}");
      print("Net Salary (Basic + Overtime): \$${netSalary.toStringAsFixed(2)}");
      break;

    case 14:
      // الفاتورة
      stdout.write("Enter the purchase amount: ");
      String? userAmount = stdin.readLineSync();
      double purchaseAmount = double.tryParse(userAmount ?? '0') ?? 0.0;

      double discountRate = 0.0;
      if (purchaseAmount > 20000) {
        discountRate = 0.12;
      } else if (purchaseAmount >= 10000) {
        discountRate = 0.07;
      }

      double discountValue = purchaseAmount * discountRate;
      double netAmount = purchaseAmount - discountValue;

      print("\n--- Invoice Details ---");
      print("Purchase Amount: \$${purchaseAmount.toStringAsFixed(2)}");
      print("Discount Value: \$${discountValue.toStringAsFixed(2)}");
      print("Net Amount after Discount: \$${netAmount.toStringAsFixed(2)}");
      break;

    default:
      print("Invalid choice!");
  }
}
