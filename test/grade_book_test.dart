import 'package:dart_exercises/grade_book.dart';
import 'package:test/test.dart';

void main() {
  test('Grade.forAverage maps an average to a grade', () {
    expect(Grade.forAverage(85), Grade.a);
    expect(Grade.forAverage(84.9), Grade.b);
    expect(Grade.forAverage(70), Grade.b);
    expect(Grade.forAverage(55), Grade.c);
    expect(Grade.forAverage(40), Grade.d);
    expect(Grade.forAverage(39.9), Grade.f);
    expect(Grade.forAverage(0), Grade.f);
  });

  test('addMark keeps marks from 0 to 100 and refuses others', () {
    var student = Student('Ali');
    expect(student.addMark(78), isTrue);
    expect(student.addMark(101), isFalse);
    expect(student.addMark(-1), isFalse);
    expect(student.marks, [78]);
  });

  test('average is null for a student with no marks', () {
    expect(Student('Ali').average, isNull);
  });

  test('average is the mean of the marks', () {
    var student = Student('Ali');
    for (var mark in [78, 91, 64]) {
      student.addMark(mark);
    }
    expect(student.average, closeTo(77.67, 0.01));
  });

  test('grade follows the average, and is null without marks', () {
    var student = Student('Fatima');
    expect(student.grade, isNull);
    student.addMark(90);
    student.addMark(80);
    expect(student.grade, Grade.a);
  });

  test('addStudent adds a student once and refuses a duplicate name', () {
    var book = GradeBook();
    expect(book.addStudent('Ali'), isTrue);
    expect(book.addStudent('Ali'), isFalse);
    expect(book.students.length, 1);
  });

  test('find returns the student, or null for an unknown name', () {
    var book = GradeBook();
    book.addStudent('Ali');
    expect(book.find('Ali')?.name, 'Ali');
    expect(book.find('Sara'), isNull);
  });

  test('addMark through the grade book reaches the student', () {
    var book = GradeBook();
    book.addStudent('Ali');
    expect(book.addMark('Ali', 78), isTrue);
    expect(book.addMark('Sara', 78), isFalse);
    expect(book.find('Ali')?.marks, [78]);
  });

  test('topStudent is the student with the highest average', () {
    var book = GradeBook();
    book.addStudent('Ali');
    book.addStudent('Fatima');
    book.addStudent('Zain');
    for (var mark in [78, 91, 64]) {
      book.addMark('Ali', mark);
    }
    for (var mark in [95, 87]) {
      book.addMark('Fatima', mark);
    }
    expect(book.topStudent?.name, 'Fatima');
  });

  test('topStudent is null for an empty grade book', () {
    expect(GradeBook().topStudent, isNull);
  });
}
