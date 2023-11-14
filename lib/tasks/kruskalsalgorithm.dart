class Graph {
  late List<Edge> edges;
  late List<int> parent;

  Graph(int vertices) {
    edges = [];
    parent = List<int>.generate(vertices, (index) => index);
  }

  void addEdge(int source, int destination, int weight) {
    edges.add(Edge(source, destination, weight));
  }

  List<Edge> kruskal() {
    List<Edge> minimumSpanningTree = [];

    edges.sort((a, b) => a.weight.compareTo(b.weight));

    for (int i = 0; i < edges.length; i++) {
      int rootSource = findRoot(edges[i].source);
      int rootDestination = findRoot(edges[i].destination);

      if (rootSource != rootDestination) {
        minimumSpanningTree.add(edges[i]);
        union(rootSource, rootDestination);
      }
    }

    return minimumSpanningTree;
  }

  int findRoot(int vertex) {
    if (parent.isEmpty || vertex >= parent.length) {
      return vertex;
    }

    if (parent[vertex] != vertex) {
      parent[vertex] = findRoot(parent[vertex]);
    }

    return parent[vertex];
  }

  void union(int x, int y) {
    int rootX = findRoot(x);
    int rootY = findRoot(y);
    parent[rootX] = rootY;
  }
}

class Edge {
  int source, destination, weight;

  Edge(this.source, this.destination, this.weight);
}

void kruskalsAlgorithmPrint() {
  Graph graph = Graph(4);

  graph.addEdge(0, 1, 10);
  graph.addEdge(0, 2, 6);
  graph.addEdge(0, 3, 5);
  graph.addEdge(1, 3, 15);
  graph.addEdge(2, 3, 4);
  List<Edge> minimumSpanningTree = graph.kruskal();

  print(' \nМинимальное остовное дерево (Алгоритм Краскала Kruskal\'s Algorithm):');
  for (var edge in minimumSpanningTree) {
    print('${edge.source} -- ${edge.destination} : ${edge.weight}');
  }
}
