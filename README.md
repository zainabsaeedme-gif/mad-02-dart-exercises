# Dart exercises: week 2 starter

This is the starter code for week 2 of Mobile Application Development. It has two exercises: a bank account (Exercise 1) and a grade book (Exercise 2).

This project needs Dart 3.14.0 or newer. It comes with Flutter 3.50.0 or newer.

## How to run

Open a terminal in this folder and run these two commands:

```bash
dart pub get
dart run
```

To run the old grade book, the same program before classes, use this command:

```bash
dart run bin/grade_book_v0.dart
```

## Your tasks

Read both files in `lib/` first; the comments explain the given code. Then do TODO 1 and 2 in `lib/bank_account.dart` and TODO 3 to 6 in `lib/grade_book.dart`. The handout explains each.

## Tests

Run the tests with this command:

```bash
dart test
```

On the untouched starter, 11 tests pass and 9 fail. Nine of the passing tests check the given code. The other two check what TODO 4 and TODO 6 return when there is nothing to return, and the placeholder already gets that right. The failing tests are expected. GitHub Actions runs the same tests on every push, so it shows a red cross until you finish. When all six TODOs are done, the last line says `All tests passed!`

## My screenshot

![The terminal after dart test and dart run](screenshot.png)(screenshoot.jpg)

Replace this picture with your own. Run `dart test` and `dart run`, take a screenshot of your terminal, name it `screenshot.png`, and put it in the top folder of this repository, next to this README.

## AI note

I asked AI to explain how find() works in the find() method, then I wrote the code myself and tested it with dart test.
