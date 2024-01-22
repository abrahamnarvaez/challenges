#!/bin/python3

from collections import deque
from collections import defaultdict

def bfs(edges):
    # create graph
    graph_dict = defaultdict(list)
    for e in edges:
        graph_dict[e[0]].append(e[1])
        graph_dict[e[1]].append(e[0])

    # BFS
    # 
    visited = [False] * len(graph_dict)
    queue = deque()
    s = 2
    queue.append(s)
    visited[s] = True

    while queue:
        v = queue.popleft()
        print(v)
        for a in graph_dict[v]:
            if visited[a] == False:
                queue.append(a)
                visited[a] = True

if __name__ == '__main__':
    edges = [[0, 1], [0, 2], [1, 2], [2, 3], [1, 3], [3, 4], [4, 5], [5, 1]]
    bfs(edges)
