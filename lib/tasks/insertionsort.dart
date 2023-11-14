List<int> numbers = [64, 34, 25, 12, 22, 11, 90];

void insertionSort(List<int> arr) {
  for (int i = 1; i < arr.length; i++) {
    int key = arr[i];
    int j = i - 1;

    while (j >= 0 && arr[j] > key) {
      arr[j + 1] = arr[j];
      j = j - 1;
    }

    arr[j + 1] = key;
  }
}

void insertionSortPrint() {
  print('Сортировка вставками (Insertion Sort). \nИсходный массив $numbers');
  insertionSort(numbers);
  print("Отсортированный массив: $numbers.\n");
}