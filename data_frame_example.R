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
      "Name1", "Name2", "Name3", "Name4"
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
      1, 3, 5, 7
      ),
    y = c(
      7, 7, 7, 7
      )
  )

graph_1 <-
  create_graph(
    nodes_df = nodes,
    graph_attrs = c("layout = neato",
                    "overlap = 'false'",
                    "fontname = Ubuntu"
                    ),
    node_attrs = c("color = orange",
                   "fixedsize = true"
                   ),
    edge_attrs = c("relationship = requires",
                   "arrowhead = inv",
                   "color = grey"
                   )
  )

render_graph(graph_1)

graph_1 %>%
  add_to_series(series) ->
  series

graph_1 %>%
  add_node(node = "d1",
           label = "D1",
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
  add_node(node = "d2",
           from = "d1",
           label = "D2",
           style = "filled",
           shape = "circle",
           color = "orange",
           x = 1,
           y = 5
          ) ->
  graph_3

render_graph(graph_3)

graph_3 %>%
  add_to_series(series) ->
  series

graph_3 %>%
  add_node(
    node = "o1",
    from = "d1",
    label = "O1",
    style = "filled",
    shape = "circle",
    color = "orange",
    x = 7,
    y = 6
  ) ->
  graph_4

render_graph(graph_4)

graph_4 %>%
  add_to_series(series) ->
  series

graph_4 %>%
  add_node(
    node = "a1",
    from = "o1",
    label = "A1",
    style = "filled",
    shape = "circle",
    color = "orange",
    x = 5,
    y = 6
  ) ->
  graph_5

render_graph(graph_5)

graph_4 %>%
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

graph_3 %>%
  add_node(node = "a3b",
           from = "a2",
           label = "A3b",
           style = "filled",
           shape = "circle",
           color = "yellow",
           x = 4,
           y = 4
  ) ->
  graph_4

graph_4 %>%
  add_to_series(series) ->
  series

render_graph_from_series(
  graph_series = series,
  graph_no = 4)


graph_4 %>%
  add_node(node = "a4",
           from = "a2",
           label = "A4",
           style = "filled",
           shape = "circle",
           color = "orange",
           x = 3,
           y = 3
  ) ->
  graph_5

graph_5 %>%
  add_to_series(series) ->
  series

render_graph_from_series(
  graph_series = series,
  graph_no = 5)

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

