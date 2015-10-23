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
      1, 3, 5, 3
      ),
    y = c(
      7, 7, 7, 15
      )
  )

graph_1 <-
  create_graph(
    nodes_df = nodes,
    graph_attrs = c(
      "layout = neato",
      "overlap = 'false'",
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
  add_to_series(series) ->
  series

graph_1 %>%
  add_node(
    node = "d1",
    label = "A1",
    style = "filled",
    shape = "circle",
    color = "orange",
    x = 1,
    y = 6
  ) ->
  graph_2

render_graph(graph_2)

graph_2 %>%
  add_to_series(series) ->
  series

graph_2 %>%
  add_node(
    node = "o1",
    label = "A1",
    style = "filled",
    shape = "circle",
    color = "orange",
    x = 3,
    y = 14
  ) ->
  graph_3

render_graph(graph_3)

graph_3 %>%
  add_to_series(series) ->
  series

graph_3 %>%
  add_edges(
    from = "dictator",
    to = "origin"
  ) ->
  graph_4

render_graph(graph_4)

graph_4 %>%
  add_to_series(series) ->
  series

graph_4 %>%
  add_node(
    node = "b1",
    label = "A1",
    style = "filled",
    shape = "circle",
    color = "orange",
    x = 5,
    y = 6
  ) ->
  graph_5

render_graph(graph_5)

graph_5 %>%
  add_to_series(series) ->
  series

graph_5 %>%
  add_edges(
    from = "origin",
    to = "bob"
  ) ->
  graph_6

render_graph(graph_6)

graph_6 %>%
  add_to_series(series) ->
  series

graph_6 %>%
  add_node(
    node = "a1",
    label = "A1",
    style = "filled",
    shape = "circle",
    color = "orange",
    x = 3,
    y = 6
  ) ->
  graph_7

render_graph(graph_7)

graph_7 %>%
  add_to_series(series) ->
  series

new_edges <- create_edges(
  from = "origin",
  to = "alice",
  color = "pink"
)

graph_8 %>%
  add_edges(
    edges_df = new_edges
  ) ->
  graph_8

render_graph(graph_8)

graph_8 %>%
  add_to_series(series) ->
  series

graph_9 %>%
  add_node(
    node = "a2",
    from = "a1",
    label = "A2",
    style = "filled",
    shape = "circle",
    color = "orange",
    x = 3,
    y = 5
  ) ->
  graph_10

render_graph(graph_10)

graph_10 %>%
  add_to_series(series) ->
  series

graph_10 %>%
  add_node(
    node = "d2",
    from = "d1",
    label = "A2",
    style = "filled",
    shape = "circle",
    color = "orange",
    x = 1,
    y = 5
  ) ->
  graph_11

render_graph(graph_11)

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

