###
# Create two data frames for nodes
# Singly supplied attribute values are repeated down
###

library(DiagrammeR)
library(magrittr)
# library(V8)

# create a new graph series
series <- create_series(series_type = "sequential")

# Set up: just the labels
nodes <-
  create_nodes(
    nodes = c(
      "dictator", "alice", "bob", "origin"
      ),
    label = c(
      "Dict", "Alice", "Bob", "Origin"
      ),
    type = "lower",
    style = "filled",
    shape = c(
      "rectangle", "rectangle", "rectangle", "rectangle"
      ),
    color = c(
      rep(x = "lightgrey", 4)
      ),
    x = c(
      9, 9, 1, 4
      ),
    y = c(
      7, 15, 7, 15
      )
  )

# Build first graph with just the labels.
# Parameters are the ones that will be used by defoult if not specified
graph_1 <-
  create_graph(
    nodes_df = nodes,
    graph_attrs = c(
      "layout = neato",
      "overlap = 'false'",
      "splines = 'true'",
      "fontname = Ubuntu"
      ),
    node_attrs = c(
      "color = orange",
      "fixedsize = true"
      ),
    edge_attrs = c(
      "relationship = requires",
      "arrowhead = normal",
      "color = 'lightgrey'"
      )
  )

render_graph(graph_1)

graph_1 %>%
  add_node(
    node = "d1",
    label = "A",
    style = "filled",
    shape = "circle",
    color = "orange",
    x = 9,
    y = 6
  ) ->
  graph_2

render_graph(graph_2)
graph_2

new_edges <- create_edges(
  from = "dictator",
  to = "origin",
  color = "lightseagreen",
  tooltip = "push"
)

graph_2 %>%
  add_edges(
    edges_df = new_edges
  ) ->
  graph_3

render_graph(graph_3)
graph_3

graph_3 %>%
  add_node(
    node = "o1",
    label = "A",
    style = "filled",
    shape = "circle",
    color = "orange",
    x = 4,
    y = 14
  ) ->
  graph_4

render_graph(graph_4)

new_edges <- create_edges(
  from = c("origin", "origin"),
  to = c("alice", "bob"),
  color = "lightseagreen",
  tooltip = "pull"
)

graph_4 %>%
  add_edges(
    edges_df = new_edges
  ) ->
  graph_5

render_graph(graph_5)

graph_5 %>%
  add_node(
    node = "a1",
    label = "A",
    style = "filled",
    shape = "circle",
    color = "orange",
    x = 9,
    y = 14
  ) %>%
  add_node(
    node = "b1",
    label = "A",
    style = "filled",
    shape = "circle",
    color = "orange",
    x = 1,
    y = 6
  ) ->
  graph_6

render_graph(graph_6)

graph_6 %>%
  add_node(
    node = "a2",
    from = "a1",
    label = "B",
    style = "filled",
    shape = "circle",
    color = "orange",
    x = 10,
    y = 13
  ) ->
  graph_7

render_graph(graph_7)

new_edges <- create_edges(
  from = "alice",
  to = "dictator",
  color = "lightseagreen",
  tooltip = "pull"
)

graph_7 %>%
  add_edges(
    edges_df = new_edges
  ) ->
  graph_8

render_graph(graph_8)

graph_8 %>%
  add_node(
    node = "d2b",
    from = "d1",
    label = "B",
    style = "filled",
    shape = "circle",
    color = "orange",
    x = 10,
    y = 5
  ) ->
  graph_9

render_graph(graph_9)

graph_9 %>%
  add_node(
    node = "d2",
    from = c("d1", "d2b"),
    label = "C",
    style = "filled",
    shape = "circle",
    color = "orange",
    x = 9,
    y = 4
  ) ->
  graph_10

render_graph(graph_10)

graph_10 %>%
  add_node(
    node = "o2",
    from = "o1",
    label = "B",
    style = "filled",
    shape = "circle",
    color = "orange",
    x = 5,
    y = 13
  ) %>%
  add_node(
    node = "o3",
    from = c("o1", "o2"),
    label = "C",
    style = "filled",
    shape = "circle",
    color = "orange",
    x = 4,
    y = 12
  ) ->
  graph_11

render_graph(graph_11)

graph_11 %>%
  add_node(
    node = "b2",
    from = "b1",
    label = "D",
    style = "filled",
    shape = "circle",
    color = "orange",
    x = 2,
    y = 5
  ) %>%
  add_node(
    node = "b3",
    from = "b2",
    label = "E",
    style = "filled",
    shape = "circle",
    color = "orange",
    x = 2,
    y = 4
  ) ->
  graph_12

render_graph(graph_12)

#






graph_11 %>%
  add_to_series(series) ->
  series

graph_11$graph_name <- "git_workflow"

render_graph_from_series(
  graph_series = series,
  graph_no = 2)


#___________________________________

render_graph_from_series(
  graph_series = series,
  graph_no = 1)

render_graph_from_series(
  graph_series = series,
  graph_no = 2)

render_graph_from_series(
  graph_series = series,
  graph_no = 3)

render_graph_from_series(
  graph_series = series,
  graph_no = 4)

render_graph_from_series(
  graph_series = series,
  graph_no = 5)

