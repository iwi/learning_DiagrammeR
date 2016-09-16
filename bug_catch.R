library(DiagrammeR)
library(magrittr)

# Set up: just the labels

create_nodes(
  nodes = c(
    "zalpha", "beta"
  ),
  label = c(
    "A", "B"
  )
) -> nodes

# generic graph
create_graph(
  nodes_df = nodes
) -> g0

g0$nodes_df

g0 %>%
  add_node_df(
    node_df = create_nodes(
      nodes = "c",
      label = "C"
    )
  ) -> g1

g1$nodes_df  # note the nodes identifiers have changed to Natural numbers

# then it fails
g1 %>%
  add_edge_df(
    edge_df = create_edges(
      from = "zalpha",
      to = "beta"
    )
  ) ->  g2

g2$nodes_df


# but it would have worked like this
g0 %>%
  add_edge_df(
    edge_df = create_edges(
      from = "a",
      to = "b"
    )
  ) ->  g2

g2$nodes_df






nodes <-
  create_nodes(
    nodes = c(
      1, 2
    ),
    label = c(
      "A", "B"
    )
  )
