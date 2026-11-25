/// Exercise 2: a grade book, built from classes.
///
/// `bin/grade_book_v0.dart` is the same program before classes: one map and
/// five functions. Three of its functions still need a home here. Each TODO
/// below says which one to move, and into which class. Read the given code
/// first: the comments name the idea each part shows.
///
/// An enum with a field: each Grade carries the lowest average that earns it.
enum Grade {
  a(85),
  b(70),
  c(55),
  d(40),
  f(0);

  const Grade(this.minAverage);

  /// The lowest average that earns this grade.
  final int minAverage;

  // TODO 3: Move `letterGrade` from bin/grade_book_v0.dart here. Loop over
  // Grade.values and return the first grade whose minAverage is not above
  // the average.
  static Grade forAverage(double average) {
  for (final grade in Grade.values) {
    if (average >= grade.minAverage) {
      return grade;
    }
  }
  return Grade.f;
}
}

class Student {
  Student(this.name);

  final String name;

  /// Encapsulation: the list is private, so marks can only be added through
  /// `addMark`, which checks them.
  final List<int> _marks = [];

  /// A copy of the marks that nobody can change.
  List<int> get marks => List.unmodifiable(_marks);

  bool addMark(int mark) {
    if (mark < 0 || mark > 100) {
      return false;
    }
    _marks.add(mark);
    return true;
  }

  // TODO 4: Move `average` from bin/grade_book_v0.dart here. Return null if
  // there are no marks; otherwise add up the marks and divide by how many.
 double? get average {
 if (_marks.isEmpty) {

  return null;
}
var sum = 0;
for (final mark in _marks) {
  sum += mark;
}
return sum / _marks.length;
}

  /// Null safety: `average` may be null, so `grade` may be null too. Copy the
  /// getter into a local variable first, then check it.
  Grade? get grade {
    var currentAverage = average;
    if (currentAverage == null) {
      return null;
    }
    return Grade.forAverage(currentAverage);
  }

  @override
  String toString() {
    var currentAverage = average;
    var currentGrade = grade;
    if (currentAverage == null || currentGrade == null) {
      return '$name: no marks yet';
    }
    var text = currentAverage.toStringAsFixed(1);
    return '$name: $text (${currentGrade.name.toUpperCase()})';
  }
}

class GradeBook {
  /// A Map from each name to its Student. Private: use the methods below.
  final Map<String, Student> _students = {};

  List<Student> get students => List.unmodifiable(_students.values);

  bool addStudent(String name) {
    if (_students.containsKey(name)) {
      return false;
    }
    _students[name] = Student(name);
    return true;
  }

  // TODO 5: Return the student with this name, or null if there is none.
  // A Map lookup already gives exactly that.
  Student? find(String name) {
    return _students[name];
  }

  /// Null safety: `find` may return null, so check before using the student.
  bool addMark(String name, int mark) {
    var student = find(name);
    if (student == null) {
      return false;
    }
    return student.addMark(mark);
  }

  // TODO 6: Move `topStudent` from bin/grade_book_v0.dart here. Return the
  // student with the highest average, or null if no student has marks.
  // The old version returns a name; this one returns the Student.
  Student? get topStudent {
  Student? best;
  for (final student in _students.values) {
    final avg = student.average;
    if (avg == null) {
      continue;
    }
    if (best == null || avg > best.average!) {
      best = student;
    }
  }
  return best;
}

  String report() {
    var lines = <String>[];
    for (var student in _students.values) {
      lines.add(student.toString());
    }
    var top = topStudent;
    lines.add('Top student: ${top?.name ?? 'nobody yet'}');
    return lines.join('\n');
  }
}
