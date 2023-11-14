List<int> numbers = [64, 34, 25, 12, 22, 11, 90];

List<int> mergeSort(List<int> arr) {
  if (arr.length <= 1) {
    return arr;
  }

  int middle = arr.length ~/ 2;
  List<int> left = arr.sublist(0, middle);
  List<int> right = arr.sublist(middle);

  return merge(mergeSort(left), mergeSort(right));
}

List<int> merge(List<int> left, List<int> right) {
  List<int> result = [];

  int i = 0, j = 0;

  while (i < left.length && j < right.length) {
    if (left[i] < right[j]) {
      result.add(left[i]);
      i++;
    } else {
      result.add(right[j]);
      j++;
    }
  }

  while (i < left.length) {
    result.add(left[i]);
    i++;
  }

  while (j < right.length) {
    result.add(right[j]);
    j++;
  }

  return result;
}

void mergeSortPrint() {
  print('Сортировка слиянием (Merge Sort). \nИсходный массив: $numbers');
  List<int> sortedNumbers = mergeSort([...numbers]);
  print('Отсортированный массив: $sortedNumbers');
}
