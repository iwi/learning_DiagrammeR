library(DiagrammeR)
grViz("
  digraph boxes_and_circles {


    alpha
    @@1-1; @@1-2; @@1-3; @@1-4; @@1-5
    @@1-6; @@1-7; @@1-8; @@1-9; @@1-10


      # a 'graph' statement
      graph [
        overlap = true,
        fontsize = 10
      ]

      # several 'node' statements
      node [
        shape = box,
        fontname = Helvetica
      ]
      A; B; C; D; E; F

      node [
        shape = circle,
        fixedsize = true,
        width = 0.9
      ] // sets as circles
      1; 2; 3; 4; 5; 6; 7; 8

      subgraph {
        rank = same; 1; 3; 4;
      }

      # several 'edge' statements
      A -> 1
      B -> { 2, 3, 4, B }
      C -> A
      1 -> D
      E -> { A, 6 }
      2 -> 4
      1 -> 5
      1 -> F
      4 -> 6
      5 -> 7
      6 -> 7
      3 -> { 8, 1 }
      8 -> 6
    B [ fillcolor = red ]
  }

[1]: LETTERS


")

