###
# Create two data frames for nodes
# Singly supplied attribute values are repeated down
###

library(DiagrammeR)
library(magrittr)
# library(V8)

# create a new graph series
series <- create_series(series_type = "sequential",
                        series_name = "git_workflow_example")

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
    graph_name = "git_workflow",
    nodes_df = nodes,
    graph_attrs = c(
      "layout = neato",
      "overlap = 'false'",
      "splines = 'true'",
      "fontname = Helvetica"
      ),
    node_attrs = c(
      "fixedsize = true"
      ),
    directed = "true"
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

new_edges <- create_edges(
  from = "dictator",
  to = "origin",
  color = "lightseagreen"
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
  color = "lightseagreen"
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

new_edge <-
  create_edges(
    from = "a1",
    to = "a2",
    color = "lightgrey"
  )

graph_6 %>%
  add_node(
    node = "a2",
    label = "B",
    style = "filled",
    shape = "circle",
    color = "orange",
    x = 10,
    y = 13
  ) %>%
  add_edges(
    edges_df = new_edge
    ) ->
    graph_7

render_graph(graph_7)

new_edges <- create_edges(
  from = "alice",
  to = "dictator",
  color = "lightseagreen"
)

graph_7 %>%
  add_edges(
    edges_df = new_edges
  ) ->
  graph_8

render_graph(graph_8)

new_edge <-
  create_edges(
    from = "d1",
    to = "d2b",
    color = "lightgrey"
  )

graph_8 %>%
  add_node(
    node = "d2b",
    label = "B",
    style = "filled",
    shape = "circle",
    color = "orange",
    x = 10,
    y = 5
  ) %>%
  add_edges(
    edges_df = new_edge
  ) ->
  graph_9

render_graph(graph_9)

new_edges <-
  create_edges(
    from = c("d1", "d2b"),
    to = c("d2", "d2"),
    color = "lightgrey"
  )

graph_9 %>%
  add_node(
    node = "d2",
    label = "C",
    style = "filled",
    shape = "circle",
    color = "orange",
    x = 9,
    y = 4
  ) %>%
  add_edges(
    edges_df = new_edges
    ) ->
    graph_10

render_graph(graph_10)

  create_edges(
    from = "d1",
    to = "d2",
    color = "lightgrey"
  )

graph_10 %>%
  add_node(
    node = "o2",
    label = "B",
    style = "filled",
    shape = "circle",
    color = "orange",
    x = 5,
    y = 13
  ) %>%
  add_edges(
    edges_df = create_edges(
      from = "o1",
      to = "o2",
      color = "lightgrey"
      )
    ) %>%
  add_node(
    node = "o3",
    label = "C",
    style = "filled",
    shape = "circle",
    color = "orange",
    x = 4,
    y = 12
  ) %>%
  add_edges(
    edges_df = create_edges(
      from = c("o1", "o2"),
      to = c("o3", "o3"),
      color = "lightgrey"
      )
    ) ->
  graph_11

render_graph(graph_11)

graph_11 %>%
  add_node(
    node = "b2",
    label = "D",
    style = "filled",
    shape = "circle",
    color = "orange",
    x = 2,
    y = 5
  ) %>%
  add_edges(
    edges_df = create_edges(
      from = "b1",
      to = "b2",
      color = "lightgrey"
    )
  ) %>%
  add_node(
    node = "b3",
    label = "E",
    style = "filled",
    shape = "circle",
    color = "orange",
    x = 2,
    y = 4
  ) %>%
  add_edges(
    edges_df = create_edges(
      from = "b2",
      to = "b3",
      color = "lightgrey"
    )
  ) ->
  graph_12

render_graph(graph_12)

graph_12 %>%
  add_node(
    node = "b4",
    label = "B",
    style = "filled",
    shape = "circle",
    color = "orange",
    x = 0,
    y = 5
  ) %>%
  add_edges(
    edges_df = create_edges(
      from = "b1",
      to = "b4",
      color = "lightgrey"
    )
  ) %>%
  add_node(
    node = "b5",
    label = "C",
    style = "filled",
    shape = "circle",
    color = "orange",
    x = 1,
    y = 4
  ) %>%
  add_edges(
    edges_df = create_edges(
      from = c("b4", "b1"),
      to = c("b5", "b5"),
      color = "lightgrey"
    )
  ) ->
  graph_13

render_graph(graph_13)

graph_13 %>%
  delete_edge(
    to = "b2",
    from = "b1"
    ) ->
  graph_14

render_graph(graph_14)

graph_14 %>%
  delete_node(
    node = "b2"
  ) %>%
  add_node(
    node = "b2",
    label = "D",
    style = "filled",
    shape = "circle",
    color = "orange",
    x = 2,
    y = 3
  ) %>%
  add_edges(
    edges_df = create_edges(
      from = c("b5", "b2"),
      to = c("b2", "b3"),
      color = "lightgrey"
    )
  ) %>%
  delete_edge(
    from = "b2",
    to = "b3"
  ) ->
  graph_15

render_graph(graph_15)

display_graph_object(graph_15)
render_graph(graph_15, output = "DOT")

node_present(graph_15, node = "b3")

get_edges(graph_15, return_type = "df")

get_predecessors(graph_15, "b5")

node_type(graph_15, node = "b5", action = "create", value =  )

graph_15 %>%
  delete_node(
    node = "b3"
  ) %>%
  add_node(
    node = "b3",
    label = "E",
    style = "filled",
    shape = "circle",
    color = "orange",
    x = 2,
    y = 2
  ) %>%
  add_edges(
    edges_df = create_edges(
      from = "b2",
      to = "b3",
      color = "lightgrey"
    )
  ) ->
  graph_16

render_graph(graph_16)



graph_1 %>%
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

