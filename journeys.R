#!/bin/R
# Claimant journey 

library('DiagrammeR')
library('magrittr')
library('readr')

# get paths
paths <- read_csv('paths.csv', col_names = FALSE)

# Set up with initial nodes and edges 
number_of_nodes <- 10

initial_nodes <-
  create_nodes(
    nodes = 1:number_of_nodes,
    type = "lower",
    style = "filled",
    shape = "circle",
    color = "lightgrey", 
  )

initial_nodes$label <- paste('C', 1:number_of_nodes, sep = '') 

froms <- 


initial_edges <- 
  create_edges(
    from = c(1:(number_of_nodes - 1)),
    to = c(2:number_of_nodes), 
    color = "lightseagreen"
  )

# Build first graph with the initial nodes and edges 
graph_1 <-
  create_graph(
    graph_name = "customer journey",
    nodes_df = initial_nodes,
    edges_df = initial_edges,
    graph_attrs = c(
      "layout = dot",
      "overlap = 'false'",
      "splines = 'true'",
      "fontname = Helvetica",
      "rankdir = 'LR'"
      ),
    node_attrs = c(
      "fixedsize = TRUE"
      ),
    directed = "TRUE"
  )

render_graph(graph_1)

graph_1 %>%
  add_edge_df(
    edge_df = 
  ) -> graph_2

render_graph(graph_2)

igraph_2 <- to_igraph(graph_2)
igraph_2
plot(igraph_2)

igraph_3 <- igraph_2 + 
  vertex(11,
    shape = 'circle',
    color = 'red',
    alpha = 0.1) +
  edges(9, 11,
        color = 'blue')

edge_attr_names(igraph_3)
edge_attr(igraph_3)
graph_attr(igraph_3)
print.igraph(igraph_3)
V(igraph_3)$label <- c(node_names, 'C11')
V(igraph_3)$label
V(igraph_3)$shape

get.adjlist(igraph_3)


E(igraph_3)

plot(igraph_3)

plot(igraph_3)

graph_2 %>%
  add_node_df(
    node_df = create_nodes(
      node = "o1",
      label = "A",
      style = "filled",
      shape = "circle",
      color = "orange"
    )
  ) ->
  graph_4

render_graph(graph_4)





render_graph(graph_16)

render_graph(graph_16, output = "SVG") %>%
  cat(file = "~/coses_per_ordenar/graph.svg")

## try igraph

library(igraph)

help(igraph)


G <- graph.formula(1-+2,
                   1-+3,
                   2-+4,
                   2-+5,
                   3-+6,
                   5-+7,
                   7-+8,
                   8-+9,
                   9+-7, 
                   9-+10,
                   6-+9,
                   1-+5,
                   5-+20,
                   3-+9,
                   10-+11,
                   10-+15,
                   11-+12,
                   11-+13,
                   13-+14, 
                   14-+15,
                   15-+11,
                   4-+8,
                   15-+16,
                   15-+17,
                   17-+18,
                   18-+4,
                   17-+19,
                   19-+20,
                   20-+1,
                   14-+1,
                   19-+3)
plot(G)


input_file <- 'paths.csv'

paths <- read.csv('paths.csv', header = FALSE)

View(paths)

con  <- file(input_file, open = "r")

while (length(oneLine <- readLines(con, n = 1, warn = FALSE)) > 0) {
  path1 <- paths[1,] %>%
    gsub(', ', '-+')


} 

close(con)

get_ith_edge <- function(path, i) {
  edge_string <- paste(path[i], '-+', path[i + 1], sep = '')
}

e1p1 <- get_ith_edge(p1, 1)
e1p1


G2 <- graph.formula(1-+2-+3)
G2

a2 <- graph.formula("1"-+"2")

graph.formula

plot(G2)




graph.formula 
graph_from_literal_i
