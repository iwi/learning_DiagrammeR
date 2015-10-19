###
# Create two data frames for nodes
# Singly supplied attribute values are repeated down
###

library(DiagrammeR)

# Create a node data frame
nodes_1 <-
  create_nodes(nodes = c("a", "b", "c", "d"),
               label = FALSE,
               type = "lower",
               style = "filled",
               color = "aqua",
               shape = c("circle", "circle",
                         "rectangle", "rectangle"),
               data = c(3.5, 2.6, 9.4, 2.7))

# Create another node data frame
nodes_2 <-
  create_nodes(nodes = c("e", "f", "g", "h"),
               label = FALSE,
               type = "upper",
               style = "filled",
               color = "red",
               shape = "triangle",
               data = c(0.5, 3.9, 3.7, 8.2))

###
# Combine two data frames for nodes
###

# Combine node data frames with 'combine_nodes'
all_nodes <- combine_nodes(nodes_1, nodes_2)


###
# Create two data frames for edges
# Singly supplied attribute values are repeated down
###

# Create an edge data frame
edges_1 <-
  create_edges(from = c("a", "a", "b", "c"),
               to = c("b", "d", "d", "a"),
               relationship = "requires",
               color = "green",
               data = c(2.7, 8.9, 2.6, 0.6))

# Create another edge data frame
edges_2 <-
  create_edges(from = c("e", "g", "h", "h"),
               to = c("g", "h", "f", "e"),
               relationship = "receives",
               arrowhead = "dot",
               color = "red")

###
# Combine two data frames for edges
###

# Combine edge data frames with 'combine_edges'
all_edges <- combine_edges(edges_1, edges_2)
