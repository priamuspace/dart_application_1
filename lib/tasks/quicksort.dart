List<int> numbers = [64, 34, 25, 12, 22, 11, 90];

List<int> quickSort(List<int> arr, int low, int high) {
  if (low < high) {
    int partitionIndex = partition(arr, low, high);

    quickSort(arr, low, partitionIndex - 1);
    quickSort(arr, partitionIndex + 1, high);
  }

  return arr;
}

int partition(List<int> arr, int low, int high) {
  int pivot = arr[high];
  int i = low - 1;

  for (int j = low; j < high; j++) {
    if (arr[j] < pivot) {
      i++;
      int temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
    }
  }

  int temp = arr[i + 1];
  arr[i + 1] = arr[high];
  arr[high] = temp;

  return i + 1;
}

void quickSortPrint() {
  print('Сортировка быстрая (Quick Sort). \nИсходный массив: $numbers');
  List<int> sortedNumbers = quickSort([...numbers], 0, numbers.length - 1);
  print('Отсортированный массив: $sortedNumbers.\n');
}