import 'dart:collection';

class Graph {
  Map<int, List<int>> adjacencyList;

  Graph() : adjacencyList = {};

  void addEdge(int vertex, int edge) {
    if (!adjacencyList.containsKey(vertex)) {
      adjacencyList[vertex] = [];
    }
    adjacencyList[vertex]!.add(edge);
  }

  void bfs(int startVertex) {
    Set<int> visited = Set<int>();
    Queue<int> queue = Queue<int>();

    visited.add(startVertex);
    queue.add(startVertex);

    while (queue.isNotEmpty) {
      int currentVertex = queue.removeFirst();
      print('Посещен узел: $currentVertex');

      if (adjacencyList.containsKey(currentVertex)) {
        for (int neighbor in adjacencyList[currentVertex]!) {
          if (!visited.contains(neighbor)) {
            visited.add(neighbor);
            queue.add(neighbor);
          }
        }
      }
    }
  }
}

void bfsPrint() {
  Graph graph = Graph();
  graph.addEdge(0, 1);
  graph.addEdge(0, 2);
  graph.addEdge(1, 2);
  graph.addEdge(2, 0);
  graph.addEdge(2, 3);
  graph.addEdge(3, 3);

  print(' \nПоиск в ширину (Breadth-First Search, BFS). \nРезультат поиска в ширину (BFS):');
  graph.bfs(2);
}
