// The grade book before classes: one map and five functions.
// `dart run bin/grade_book_v0.dart` prints the report that Exercise 2
// must reproduce with classes.

void addStudent(Map<String, List<int>> book, String name) {
  if (!book.containsKey(name)) {
    book[name] = [];
  }
}

void addMark(Map<String, List<int>> book, String name, int mark) {
  var marks = book[name];
  if (marks != null && mark >= 0 && mark <= 100) {
    marks.add(mark);
  }
}

double? average(List<int> marks) {
  if (marks.isEmpty) {
    return null;
  }
  var total = 0;
  for (var mark in marks) {
    total += mark;
  }
  return total / marks.length;
}

String letterGrade(double average) {
  if (average >= 85) {
    return 'A';
  }
  if (average >= 70) {
    return 'B';
  }
  if (average >= 55) {
    return 'C';
  }
  if (average >= 40) {
    return 'D';
  }
  return 'F';
}

String? topStudent(Map<String, List<int>> book) {
  String? best;
  var bestAverage = -1.0;
  for (var entry in book.entries) {
    var currentAverage = average(entry.value);
    if (currentAverage != null && currentAverage > bestAverage) {
      best = entry.key;
      bestAverage = currentAverage;
    }
  }
  return best;
}

void main() {
  Map<String, List<int>> book = {};
  addStudent(book, 'Ali');
  addStudent(book, 'Fatima');
  addStudent(book, 'Zain');
  for (var mark in [78, 91, 64]) {
    addMark(book, 'Ali', mark);
  }
  for (var mark in [95, 87]) {
    addMark(book, 'Fatima', mark);
  }
  for (var entry in book.entries) {
    var currentAverage = average(entry.value);
    if (currentAverage == null) {
      print('${entry.key}: no marks yet');
    } else {
      var text = currentAverage.toStringAsFixed(1);
      print('${entry.key}: $text (${letterGrade(currentAverage)})');
    }
  }
  print('Top student: ${topStudent(book) ?? 'nobody yet'}');
}
