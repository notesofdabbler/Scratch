library(visNetwork)

nodes = data.frame(id = c(1, 2, 3, 4))
nodes$label = paste0("node_", nodes$id)

g = visNetwork(nodes, edges = NULL)

xscale = 1
yscale = 1
g$x$nodes$x = c(-1, -0.3, 0.3, 1) * xscale
g$x$nodes$y = c(-1, -0.3, 0.3, 1) * yscale

g$x$igraphlayout = "tree_layout"

g %>% visNodes(physics = FALSE) %>% 
  visEdges(smooth = FALSE) %>% visPhysics(stabilization = FALSE)

edges = data.frame(from = c(1, 2, 3), to = c(2, 3, 4))
edges$arrows = "to"

g = visNetwork(nodes, edges)

xscale = 2
yscale = 2

g$x$nodes$x = c(-1, -0.3, 0.3, 1) * xscale
g$x$nodes$y = c(-1, -0.3, 0.3, 1) * xscale

g$x$igraphlayout = "tree_layout"

g %>% visNodes(physics = FALSE) %>% 
  visEdges(smooth = FALSE) %>% visPhysics(stabilization = FALSE)
