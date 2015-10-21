grViz("
  digraph dot {

    node [shape = circle,
      style = filled,
      alpha = 0.5,
      color = grey
    ]

    node [
      fillcolor = red,
    ]
    '@@1' 2 3 4 5 6 7 8 9

    node [
      fillcolor = green,
    ]
    10 11 12 13 14 15

    edge [color = grey]
    '@@1' -> 2
    2 -> {3, 10}

    10 -> 11
    4 -> 5
    5 -> {6, 12}
    12 -> 13

    7 -> 8
    8 -> {9, 14}
    14 -> 15

  }
  [1] A
  ",

  engine = "dot"
)