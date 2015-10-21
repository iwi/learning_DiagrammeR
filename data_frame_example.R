###
# Create two data frames for nodes
# Singly supplied attribute values are repeated down
###

library(DiagrammeR)
library(magrittr)
library(V8)




# create a new graph series

series <- create_series(series_type = "sequential")


nodes <-
  create_nodes(
    nodes = c(
      "Name1", "Name2", "Name3", "Name4",
      "d1", "a1", "b1", "o1"
      ),
    label = c(
      "Dict", "Alice", "Bob", "Origin",
      "D1",  "A1", "B1", "O1"
      ),
    type = "lower",
    style = "filled",
    shape = c(
      "rectangle", "rectangle", "rectangle", "rectangle",
      "circle", "circle", "circle", "circle"
      ),
    color = c(
      rep(x = "lightgrey", 4),
      rep(x = "orange", 4)
      ),
    x = c(
      1, 3, 5, 7,
      1, 3, 5, 7
      ),
    y = c(
      7, 7, 7, 7,
      6, 6, 6, 6
      )
  )

graph_1 <-
  create_graph(
    nodes_df = nodes,
    graph_attrs = c("layout = neato"),
    node_attrs = c("color = orange",
                   "fixedsize = true"),
    edge_attrs = c("relationship = requires",
                   "arrowhead = inv",
                   "color = grey")
  )

render_graph(graph_1)

graph_1 %>%
  add_to_series(series) ->
  series

graph_1 %>%
  add_node(node = "d2",
           from = "d1",
           label = "D2",
           style = "filled",
           shape = "circle",
           color = "orange",
           x = 1,
           y = 5
          ) ->
  graph_2

render_graph(graph_2)

graph_2 %>%
  add_to_series(series) ->
  series

render_graph_from_series(
  graph_series = series,
  graph_no = 2)

graph_2 %>%
  add_node(node = "a2",
           from = "a1",
           label = "A2",
           style = "filled",
           shape = "circle",
           color = "orange",
           x = 3,
           y = 5
  ) ->
  graph_3

render_graph(graph_3)

graph_3 %>%
  add_to_series(series) ->
  series

render_graph_from_series(
  graph_series = series,
  graph_no = 3)




