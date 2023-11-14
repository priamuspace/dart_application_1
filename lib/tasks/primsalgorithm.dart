import 'dart:collection';
import 'package:collection/collection.dart';

class Graph {
  Map<int, Map<int, int>> adjacencyList;

  Graph() : adjacencyList = {};

  void addEdge(int startVertex, int endVertex, int weight) {
    if (!adjacencyList.containsKey(startVertex)) {
      adjacencyList[startVertex] = {};
    }
    if (!adjacencyList.containsKey(endVertex)) {
      adjacencyList[endVertex] = {};
    }
    adjacencyList[startVertex]![endVertex] = weight;
    adjacencyList[endVertex]![startVertex] = weight;
  }

  List<Edge> prim(int startVertex) {
    List<Edge> minimumSpanningTree = [];
    HashSet<int> visited = HashSet<int>();
    PriorityQueue<List<int>> priorityQueue = HeapPriorityQueue<List<int>>(
      (a, b) => a[1].compareTo(b[1]),
    );

    visited.add(startVertex);

    if (adjacencyList.containsKey(startVertex)) {
      for (var entry in adjacencyList[startVertex]!.entries) {
        int neighbor = entry.key;
        int weight = entry.value;
        priorityQueue.add([startVertex, neighbor, weight]);
      }
    }

    while (priorityQueue.isNotEmpty) {
      List<int> edge = priorityQueue.removeFirst();

      int source = edge[0];
      int destination = edge[1];
      int weight = edge[2];

      if (!visited.contains(destination)) {
        minimumSpanningTree.add(Edge(source, destination, weight));
        visited.add(destination);

        if (adjacencyList.containsKey(destination)) {
          for (var entry in adjacencyList[destination]!.entries) {
            int neighbor = entry.key;
            int weight = entry.value;
            priorityQueue.add([destination, neighbor, weight]);
          }
        }
      }
    }

    return minimumSpanningTree;
  }
}

class Edge {
  int source, destination, weight;

  Edge(this.source, this.destination, this.weight);
}

void primsAlgorithmPrint() {
  Graph graph = Graph();

  graph.addEdge(0, 1, 2);
  graph.addEdge(0, 2, 4);
  graph.addEdge(1, 2, 1);
  graph.addEdge(1, 3, 7);
  graph.addEdge(2, 4, 3);
  graph.addEdge(3, 4, 1);
  graph.addEdge(3, 5, 5);
  graph.addEdge(4, 5, 6);

  List<Edge> minimumSpanningTree = graph.prim(0);

  print(' \nМинимальное остовное дерево (Алгоритм Прима):');
  for (var edge in minimumSpanningTree) {
    print('${edge.source} -- ${edge.destination} : ${edge.weight}');
  }
}
