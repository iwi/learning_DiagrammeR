###
# Create graph for basic Git workflow presentation
###

source("/home/iwi/projectes/DiagrammeR/R/add_node.R")
source("/home/iwi/projectes/DiagrammeR/R/create_graph.R")
source("/home/iwi/projectes/DiagrammeR/R/combine_graphs.R")
source("/home/iwi/projectes/DiagrammeR/R/create_nodes.R")
source("/home/iwi/projectes/DiagrammeR/R/node_present.R")
source("/home/iwi/projectes/DiagrammeR/R/get_nodes.R")
source("/home/iwi/projectes/DiagrammeR/R/is_graph_empty.R")
source("/home/iwi/projectes/DiagrammeR/R/combine_nodes.R")
source("/home/iwi/projectes/DiagrammeR/R/is_graph_directed.R")
source("/home/iwi/projectes/DiagrammeR/R/add_node_df.R")

library(DiagrammeR)
library(magrittr)

# create a new graph series
series <- create_series(series_type = "sequential",
                        series_name = "git_workflow_example")


# Define location of users and relative positions

origin_location <- data.frame(x = 4,
                              y = 15)
dictator_location <- data.frame(x = origin_location$x + 5,
                                y = origin_location$y - 8)
alice_location <- data.frame(x = origin_location$x + 5,
                             y = origin_location$y)
bob_location <- data.frame(x = origin_location$x - 3,
                           y = origin_location$y - 8)

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
      dictator_location$x, alice_location$x, bob_location$x, origin_location$x
      ),
    y = c(
      dictator_location$y, alice_location$y, bob_location$y, origin_location$y
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
  add_node_df(
    node_df = create_nodes(
      nodes = "d1",
      label = "A",
      style = "filled",
      shape = "circle",
      color = "orange",
      x = dictator_location$x,
      y = dictator_location$y - 1
    )
  ) ->
  graph_2

render_graph(graph_2)

graph_2 %>%
  add_edge_df(
    edge_df = create_edges(
      from = "dictator",
      to = "origin",
      color = "lightseagreen"
    )
  ) ->
  graph_3

render_graph(graph_3)

graph_3 %>%
  add_node_df(
    node_df = create_nodes(
      node = "o1",
      label = "A",
      style = "filled",
      shape = "circle",
      color = "orange",
      x = origin_location$x,
      y = origin_location$y - 1
    )
  ) ->
  graph_4

render_graph(graph_4)

graph_4 %>%
  add_edge_df(
    edge_df = create_edges(
      from = c("origin", "origin"),
      to = c("alice", "bob"),
      color = "lightseagreen"
    )
  ) ->
  graph_5

render_graph(graph_5)

graph_5 %>%
  add_node_df(
    node_df = create_nodes(
      node = "a1",
      label = "A",
      style = "filled",
      shape = "circle",
      color = "orange",
      x = alice_location$x,
      y = alice_location$y - 1
    )
  ) %>%
  add_node_df(
    node_df = create_nodes(
      node = "b1",
      label = "A",
      style = "filled",
      shape = "circle",
      color = "orange",
      x = bob_location$x,
      y = bob_location$y - 1
    )
  ) ->
  graph_6

render_graph(graph_6)

graph_6 %>%
  add_node_df(
    node_df = create_nodes(
      node = "a2",
      label = "B",
      style = "filled",
      shape = "circle",
      color = "orange",
      x = alice_location$x + 1,
      y = alice_location$y - 2
    )
  ) %>%
  add_edge_df(
    edge_df = create_edges(
      from = "a1",
      to = "a2",
      color = "lightgrey"
    )
  ) ->
  graph_7

render_graph(graph_7)

graph_7 %>%
  add_edge_df(
    edge_df = create_edges(
      from = "alice",
      to = "dictator",
      color = "lightseagreen"
    )
  ) ->
  graph_8

render_graph(graph_8)

graph_8 %>%
  add_node_df(
    node_df = create_nodes(
      node = "d2",
      label = "B",
      style = "filled",
      shape = "circle",
      color = "orange",
      x = dictator_location$x + 1,
      y = dictator_location$y - 2
    )
  ) %>%
  add_edge_df(
    edge_df = create_edges(
      from = "d1",
      to = "d2",
      color = "lightgrey"
    )
  ) ->
  graph_9

render_graph(graph_9)

graph_9 %>%
  add_node_df(
    node_df = create_nodes(
      node = "d3",
      label = "C",
      style = "filled",
      shape = "circle",
      color = "orange",
      x = dictator_location$x,
      y = dictator_location$y - 3
    )
  ) %>%
  add_edge_df(
    edge_df = create_edges(
      from = c("d1", "d2"),
      to = c("d3", "d3"),
      color = "lightgrey"
    )
  ) ->
  graph_10

render_graph(graph_10)

graph_10 %>%
  add_node_df(
    node_df = create_nodes(
      node = "o2",
      label = "B",
      style = "filled",
      shape = "circle",
      color = "orange",
      x = origin_location$x + 1,
      y = origin_location$y - 2
    )
  ) %>%
  add_edge_df(
    edge_df = create_edges(
      from = "o1",
      to = "o2",
      color = "lightgrey"
      )
    ) %>%
  add_node_df(
    node_df = create_nodes(
      node = "o3",
      label = "C",
      style = "filled",
      shape = "circle",
      color = "orange",
      x = origin_location$x,
      y = origin_location$y - 3
    )
  ) %>%
  add_edge_df(
    edge_df = create_edges(
      from = c("o1", "o2"),
      to = c("o3", "o3"),
      color = "lightgrey"
    )
  ) ->
  graph_11

render_graph(graph_11)

graph_11 %>%
  add_node_df(
    node_df = create_nodes(
      node = "b2",
      label = "D",
      style = "filled",
      shape = "circle",
      color = "orange",
      x = bob_location$x + 1,
      y = bob_location$y - 2
    )
  ) %>%
  add_edge_df(
    edge_df = create_edges(
      from = "b1",
      to = "b2",
      color = "lightgrey"
    )
  ) %>%
  add_node_df(
    node_df = create_nodes(
      node = "b3",
      label = "E",
      style = "filled",
      shape = "circle",
      color = "orange",
      x = bob_location$x + 1,
      y = bob_location$y - 3
    )
  ) %>%
  add_edge_df(
    edge_df = create_edges(
      from = "b2",
      to = "b3",
      color = "lightgrey"
    )
  ) ->
  graph_12

render_graph(graph_12)

graph_12 %>%
  add_node_df(
    node_df = create_nodes(
      node = "b4",
      label = "B",
      style = "filled",
      shape = "circle",
      color = "orange",
      x = bob_location$x - 1,
      y = bob_location$y - 2
    )
  ) %>%
  add_edge_df(
    edge_df = create_edges(
      from = "b1",
      to = "b4",
      color = "lightgrey"
    )
  ) %>%
  add_node_df(
    node_df = create_nodes(
      node = "b5",
      label = "C",
      style = "filled",
      shape = "circle",
      color = "orange",
      x = bob_location$x,
      y = bob_location$y - 3
    )
  ) %>%
  add_edge_df(
    edge_df = create_edges(
      from = c("b4", "b1"),
      to = c("b5", "b5"),
      color = "lightgrey"
    )
  ) %>%
  add_node_df(
    node_df = create_nodes(
      node = "a3",
      label = "C",
      style = "filled",
      shape = "circle",
      color = "orange",
      x = alice_location$x,
      y = alice_location$y - 3
    )
  ) %>%
  add_edge_df(
    edge_df = create_edges(
      from = c("a1", "a2"),
      to = c("a3", "a3"),
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
  add_node_df(
    node_df = create_nodes(
      node = "b2",
      label = "D",
      style = "filled",
      shape = "circle",
      color = "orange",
      x = bob_location$x + 1,
      y = bob_location$y - 4
    )
  ) %>%
  add_edge_df(
    edge_df = create_edges(
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

graph_15 %>%
  delete_node(
    node = "b3"
  ) %>%
  add_node_df(
    node_df = create_nodes(
      node = "b3",
      label = "E",
      style = "filled",
      shape = "circle",
      color = "orange",
      x = bob_location$x + 1,
      y = bob_location$y - 5
    )
  ) %>%
  add_edge_df(
    edge_df = create_edges(
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

display_graph_object(graph_15)
render_graph(graph_15, output = "DOT")

node_present(graph_15, node = "b3")

get_edges(graph_15, return_type = "df")

get_predecessors(graph_15, "b5")

node_type(graph_15, node = "b5", action = "create", value =  )

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

