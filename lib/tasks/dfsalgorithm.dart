class Graph {
  Map<int, List<int>> adjacencyList;

  Graph() : adjacencyList = {};

  void addEdge(int vertex, int edge) {
    if (!adjacencyList.containsKey(vertex)) {
      adjacencyList[vertex] = [];
    }
    adjacencyList[vertex]!.add(edge);
  }

  void dfs(int startVertex) {
    Set<int> visited = Set<int>();
    dfsRecursive(startVertex, visited);
  }

  void dfsRecursive(int vertex, Set<int> visited) {
    visited.add(vertex);
    print('Посещен узел: $vertex');

    if (adjacencyList.containsKey(vertex)) {
      for (int neighbor in adjacencyList[vertex]!) {
        if (!visited.contains(neighbor)) {
          dfsRecursive(neighbor, visited);
        }
      }
    }
  }
}

void dfsPrint() {
  Graph graph = Graph();
  graph.addEdge(0, 1);
  graph.addEdge(0, 2);
  graph.addEdge(1, 2);
  graph.addEdge(2, 0);
  graph.addEdge(2, 3);
  graph.addEdge(3, 3);

  print(' \nПоиск в глубину (Depth-First Search, DFS). \nРезультат поиска в глубину (DFS):');
  graph.dfs(2);
}
