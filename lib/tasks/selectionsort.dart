List<int> numbers = [64, 34, 25, 12, 22, 11, 90];

void selectionSort(List<int> arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    int minIndex = i;

    for (int j = i + 1; j < arr.length; j++) {
      if (arr[j] < arr[minIndex]) {
        minIndex = j;
      }
    }

    if (minIndex != i) {
      int temp = arr[i];
      arr[i] = arr[minIndex];
      arr[minIndex] = temp;
    }
  }
}

void selectionSortPrint() {
  print('Сортировка выбором (Selection Sort). \nИсходный массив $numbers');
  selectionSort(numbers);
  print("Отсортированный массив: $numbers.\n");
}