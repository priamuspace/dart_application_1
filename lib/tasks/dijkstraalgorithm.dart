import 'package:collection/collection.dart';

class Graph {
  Map<int, Map<int, int>> adjacencyList;

  Graph() : adjacencyList = {};

  void addEdge(int startVertex, int endVertex, int weight) {
    if (!adjacencyList.containsKey(startVertex)) {
      adjacencyList[startVertex] = {};
    }
    adjacencyList[startVertex]![endVertex] = weight;
  }

  Map<int, int> dijkstra(int startVertex) {
    Set<int> visited = Set<int>();
    Map<int, int> distance = {};
    PriorityQueue<List<int>> priorityQueue = HeapPriorityQueue<List<int>>(
      (a, b) => a[1].compareTo(b[1]),
    );

    distance[startVertex] = 0;
    priorityQueue.add([startVertex, 0]);

    while (priorityQueue.isNotEmpty) {
      int currentVertex = priorityQueue.removeFirst()[0];

      if (visited.contains(currentVertex)) {
        continue;
      }

      visited.add(currentVertex);

      if (adjacencyList.containsKey(currentVertex)) {
        for (var entry in adjacencyList[currentVertex]!.entries) {
          int neighbor = entry.key;
          int weight = entry.value;

          int newDistance = distance[currentVertex]! + weight;

          if (!distance.containsKey(neighbor) ||
              newDistance < distance[neighbor]!) {
            distance[neighbor] = newDistance;
            priorityQueue.add([neighbor, newDistance]);
          }
        }
      }
    }

    return distance;
  }
}

void dijkstraAlgorithmPrint() {
  Graph graph = Graph();
  graph.addEdge(0, 1, 4);
  graph.addEdge(0, 2, 2);
  graph.addEdge(1, 2, 5);
  graph.addEdge(1, 3, 10);
  graph.addEdge(2, 3, 3);

  int startVertex = 0;
  Map<int, int> shortestDistances = graph.dijkstra(startVertex);

  print(' \nАлгоритм Дейкстры (Dijkstra\'s Algorithm).\nКратчайшие расстояния от вершины $startVertex:');
  for (var entry in shortestDistances.entries) {
    print('До вершины ${entry.key}: ${entry.value}');
  }
}
