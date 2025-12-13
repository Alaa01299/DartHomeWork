import 'dart:io';

void main() {
  final List<Student> students = [];

  while (true) {
    print("\n==== MENU ====");
    print("(a) Add student");
    print("(s) Search students");
    print("(u) Update student(s)");
    print("(d) Delete student(s)");
    print("(l) List all");
    print("(e) Exit");
    stdout.write("Choose: ");
    final option = stdin.readLineSync()?.trim().toLowerCase() ?? "";

    if (option == "a") {
      final id = _readInt("Enter Student ID: ");
      final name = _readString("Enter Student Name: ");
      final migor = _readString("Enter Student Migor: ");
      final marks = _readDouble("Enter Student Marks: ");

      students.add(Student(id: id, name: name, migor: migor, marks: marks));
      print(" Student added.");

    } else if (option == "s") {
      _searchFlow(students);

    } else if (option == "u") {
      _updateFlow(students);

    } else if (option == "d") {
      _deleteFlow(students);

    } else if (option == "l") {
      if (students.isEmpty) {
        print("NO Data Found");
      } else {
        print("\n--- All Students (${students.length}) ---");
        for (final s in students) {
          _printStudent(s);
          print("--------------");
        }
      }

    } else if (option == "e") {
      break;

    } else {
      print(" Wrong option.");
    }
  }
}


void _searchFlow(List<Student> students) {
  if (students.isEmpty) {
    print("NO Data Found");
    return;
  }

  final results = _findByAny(students);
  if (results.isEmpty) {
    print("NO Data Found");
    return;
  }

  print("\n Found ${results.length} student(s):");
  for (final s in results) {
    _printStudent(s);
    print("--------------");
  }
}

void _updateFlow(List<Student> students) {
  if (students.isEmpty) {
    print("NO Data Found");
    return;
  }

  final matches = _findByAny(students);
  if (matches.isEmpty) {
    print("NO Data Found");
    return;
  }

  print("\n Matched ${matches.length} student(s).");
  print("Update target:");
  print("(1) Update first match only");
  print("(2) Update all matches");
  stdout.write("Choose: ");
  final c = stdin.readLineSync()?.trim();

  final toUpdate = (c == "1") ? [matches.first] : matches;

  print("\nWhat do you want to update?");
  print("(i) id   (n) name   (m) migor   (mr) marks");
  stdout.write("Choose: ");
  final field = stdin.readLineSync()?.trim().toLowerCase() ?? "";

  for (final s in toUpdate) {
    if (field == "i") {
      s.id = _readInt("New ID: ");
    } else if (field == "n") {
      s.name = _readString("New Name: ");
    } else if (field == "m") {
      s.migor = _readString("New Migor: ");
    } else if (field == "mr") {
      s.marks = _readDouble("New Marks: ");
    } else {
      print(" Wrong field option.");
      return;
    }
  }

  print(" Updated ${toUpdate.length} student(s).");
}

void _deleteFlow(List<Student> students) {
  if (students.isEmpty) {
    print("NO Data Found");
    return;
  }

  final matches = _findByAny(students);
  if (matches.isEmpty) {
    print("NO Data Found");
    return;
  }

  print("\n Matched ${matches.length} student(s).");
  print("(1) Delete first match only");
  print("(2) Delete all matches");
  stdout.write("Choose: ");
  final c = stdin.readLineSync()?.trim();

  if (c == "1") {
    students.remove(matches.first);
    print(" Deleted 1 student.");
  } else {
    for (final s in matches) {
      students.remove(s);
    }
    print(" Deleted ${matches.length} student(s).");
  }
}


List<Student> _findByAny(List<Student> students) {
  print("\nSearch by:");
  print("(i) ID");
  print("(n) Name");
  print("(m) Migor");
  print("(mr) Marks");
  stdout.write("Choose: ");
  final searchOption = stdin.readLineSync()?.trim().toLowerCase() ?? "";

if (searchOption == "i") {
    final id = _readInt("Enter ID to search: ");
    return students.where((s) => s.id == id).toList();
  } else if (searchOption == "n") {
    final name = _readString("Enter Name to search: ");
    return students
        .where((s) => s.name.toLowerCase() == name.toLowerCase())
        .toList();
  } else if (searchOption == "m") {
    final migor = _readString("Enter Migor to search: ");
    return students
        .where((s) => s.migor.toLowerCase() == migor.toLowerCase())
        .toList();
  } else if (searchOption == "mr") {
    final marks = _readDouble("Enter Marks to search: ");
    return students.where((s) => s.marks == marks).toList();
  } else {
    print(" Wrong search option.");
    return [];
  }
}


int _readInt(String msg) {
  while (true) {
    stdout.write(msg);
    final input = stdin.readLineSync()?.trim();
    final value = int.tryParse(input ?? "");
    if (value != null) return value;
    print(" Please enter a valid integer.");
  }
}

double _readDouble(String msg) {
  while (true) {
    stdout.write(msg);
    final input = stdin.readLineSync()?.trim();
    final value = double.tryParse(input ?? "");
    if (value != null) return value;
    print(" Please enter a valid number.");
  }
}

String _readString(String msg) {
  while (true) {
    stdout.write(msg);
    final input = stdin.readLineSync()?.trim();
    if (input != null && input.isNotEmpty) return input;
    print(" Please enter a non-empty text.");
  }
}

void _printStudent(Student s) {
  print("ID: ${s.id}");
  print("Name: ${s.name}");
  print("Migor: ${s.migor}");
  print("Marks: ${s.marks}");
}


class Student {
  int id;
  String name;
  String migor;
  double marks;

  Student({
    required this.id,
    required this.name,
    required this.migor,
    required this.marks,
  });
}