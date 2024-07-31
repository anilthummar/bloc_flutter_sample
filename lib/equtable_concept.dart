
import 'package:equatable/equatable.dart';

class StringList extends Equatable {
  final List<String> values;

  StringList({required this.values});

  @override
  List<Object?> get props => [values];

}

void main() {
  // Creating an instance of StringList with values "a", "b", "c", etc.
  StringList stringList1 = StringList(values: ['v', 'b', 'c', 'd', 'e', 'f', 'g']);

  // Checking equality
  StringList anotherStringList = StringList(values: ['a', 'b', 'c', 'd', 'e', 'f', 'g']);


  print(stringList1 == stringList1); // Output: true
  print(stringList1 == anotherStringList); // Output: false
}