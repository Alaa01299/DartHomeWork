abstract class studnt {
  String name = "";
  int id = 0;

  studnt(String name, int id) {
    this.name = name;
    this.id = id;
  }
  calculateFinalGrade();
  studnttype();
  displayBasicInfo() {
    print("${id.toString()}");
    print("${name}");
  }
}

class RegularStudent extends studnt { 
  int midGrade;
  int finalGrade;
  double attendace;

  RegularStudent(
    super.name,
    super.id,
    this.midGrade,
    this.finalGrade,
    this.attendace,
  );

  @override
  calculateFinalGrade() {
    return this.midGrade + this.finalGrade;
  }

  @override
  studnttype() {
    print("Regular Student");
  }

  checkAttendance() {
    if (this.attendace >= 0.75) {
      print("attendance very good");
    } else {
      print("attendance bad");
    }
  }
}

void main(List<String> args) {
  RegularStudent rs = new RegularStudent("Ali", 2, 70, 90, 0.60);
  rs.displayBasicInfo();
  rs.studnttype();
  rs.calculateFinalGrade();
  rs.checkAttendance();
}
