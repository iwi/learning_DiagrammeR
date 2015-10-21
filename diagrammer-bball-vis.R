library(DiagrammeR)
library(magrittr)
library(visNetwork)

moment_data <- read.csv("projectes/diagrammeR_learning/moment.csv",
                        stringsAsFactors = FALSE)

# Generate the court
court <- create_nodes(nodes = "court",
                      x = 0,
                      y = 0,
                      group = "court")

# Provide the location the ball
ball <- create_nodes(nodes = "ball",
                     x = moment_data$x_loc[1] * 19.92,
                     y = moment_data$y_loc[1] * 19.8,
                     group = "ball")

# Provide the location the players
players <- create_nodes(nodes = moment_data$player_id[-1],
                        x = moment_data$x_loc[-1] * 19.92,
                        y = moment_data$y_loc[-1] * 19.8,
                        group = c(rep("a", 5), rep("b", 5)))

# Combine the node data frames
combined <- combine_nodes(court, players, ball)

# Render using 'visNetwork'
visNetwork(nodes = combined) %>%
  visNodes(physics = FALSE,
           fixed = FALSE) %>%
  visPhysics(stabilization = list(enabled = FALSE,
                                  onlyDynamicEdges = FALSE,
                                  fit = TRUE)) %>%
  visGroups(groupname = "court",
            shape = "image",
            image = "http://stats.nba.com/media/img/fullcourt.svg",
            size = 1000) %>%
  visGroups(groupname = "ball",
            shape = "image",
            image = "https://raw.githubusercontent.com/rich-iannone/DiagrammeR/master/inst/examples/orange-circle.png",
            size = 30) %>%
  visGroups(groupname = "a",
            shape = "image",
            image = "https://raw.githubusercontent.com/rich-iannone/DiagrammeR/master/inst/examples/blue-circle.png",
            size = 50) %>%
  visGroups(groupname = "b",
            shape = "image",
            image = "https://raw.githubusercontent.com/rich-iannone/DiagrammeR/master/inst/examples/green-circle.png",
            size = 50) %>%
  visInteraction(dragNodes = FALSE)
