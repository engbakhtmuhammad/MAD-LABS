void main() {
  // var: The type is inferred based on the assigned value. The variable can be reassigned to a value of the same type.

  var name = 'Alice'; // type inferred as String
  name = 'Bob'; // valid

// final: The variable can only be set once. Its value cannot be changed after the assignment.
  final age = 25; // immutable

// const: Similar to final, but the value must be a compile-time constant.
  const pi = 3.14; // compile-time constant

// - Numbers: int for integers and double for floating-point numbers.
  int num1 = 10;
  double num2 = 20.5;

// - Strings: Represented using either single (') or double quotes (").
  String greeting = 'Hello, World!';

// - Booleans: Represented by the type bool and can be either true or false.
  bool isActive = true;

// - Lists: A collection of ordered elements.
  List<int> numbers = [1, 2, 3];

// - Maps: A collection of key-value pairs.
  Map<String, int> scores = {'Alice': 90, 'Bob': 80};

  if (age > 18) {
    print('Adult');
  } else {
    print('Not an adult');
  }

  int choice = 1;
  switch (choice) {
    case 1:
      print('Choice is 1');
      break;
    case 2:
      print('Choice is 2');
      break;
    default:
      print('Invalid choice');
  }

// - For Loop: Iterates over a range of values.
  for (int i = 0; i < 5; i++) {
    print(i);
  }

// - While Loop: Repeats code while a condition is true.
  int i = 0;
  while (i < 5) {
    print(i);
    i++;
  }

// - For-in Loop: Iterates over elements in a collection like a list.
  List<String> fruits = ['apple', 'banana', 'cherry'];
  for (var fruit in fruits) {
    print(fruit);
  }

  //  Dart supports defining functions to perform specific tasks, similar to C++.

// Basic Function:
  void greet() {
    print('Hello, World!');
  }

// Functions with Parameters:
  void greetUser(String name) {
    print('Hello, $name!');
  }

// Returning Values from Functions:
  int add(int a, int b) {
    return a + b;
  }

// Optional and Named Parameters:
// - Optional parameters are enclosed in square brackets.
  void greetUserOptional([String name = 'Guest']) {
    print('Hello, $name');
  }

// - Named parameters allow you to pass arguments by name.
  void greetPassArgument({String name = 'Guest', int age = 0}) {
    print('Hello, $name, Age: $age');
  }

  greetPassArgument(name: 'Alice', age: 25); // Named parameters
}

class Animal {
  void makeSound() {
    print('Animal sound');
  }
}

class Dog extends Animal {
  @override
  void makeSound() {
    print('Bark');
  }
}
