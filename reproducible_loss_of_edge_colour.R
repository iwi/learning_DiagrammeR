###
# Reproducible example of edge colour issue
###

library(DiagrammeR)
library(magrittr)

nodes <-
  create_nodes(
    nodes = "a",
    label = "A",
    type = "lower",
    style = "filled",
    shape = "circle",
    color = "orange",
    x = 5,
    y = 4
  )

graph_1 <-
  create_graph(
    nodes_df = nodes,
    graph_attrs = c(
      "layout = neato"
    )
  )

render_graph(graph_1)

graph_1 %>%
  add_node(
    node = "b",
    label = "B",
    style = "filled",
    shape = "circle",
    color = "orange",
    x = 5,
    y = 3
  ) %>%
  add_edges(
    edges_df = create_edges(
      from = "a",
      to = "b",
      color = "lightgrey"
    )
  ) ->
  graph_2

render_graph(graph_2)

graph_2 %>%
  add_edges(
    edges_df = create_edges(
      from = "a",
      to = "a",
      color = "lightgrey"
    )
  ) ->
  graph_3

render_graph(graph_3)

graph_3 %>%
  delete_edge(
    to = "b",
    from = "a"
  ) ->
  graph_4

render_graph(graph_4)
