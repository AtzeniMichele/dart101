import 'dart:math';

void main() {
  final random = Random();
  List<int> randList = List.generate(10, (_) => random.nextInt(10));

  print("Initial list is $randList\n");
  print("Cleaned list is ${removeDuplicates(randList)}");
}

List<int> removeDuplicates(List<int> initialList) {
  final List<int> secondList = [];
  for (int element in initialList) {
    if (secondList.contains(element)) {
      continue;
    } else {
      secondList.add(element);
    }
  }
  return secondList;
}
