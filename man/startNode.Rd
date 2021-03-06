\name{startNode}
\alias{startNode}
\title{Retrieve Nodes from Relationships}
\description{
Retrieve the start node from a relationship. This is the node for which the relationship is outgoing.
}
\usage{
startNode(rel)
}
\arguments{
  \item{rel}{A relationship object.}
}
\value{
A node object.
}
\examples{
graph = startGraph("http://localhost:7474/db/data/")
clear(graph)

alice = createNode(graph, "Person", name = "Alice")
bob = createNode(graph, "Person", name = "Bob")

rel = createRel(alice, "WORKS_WITH", bob)

startNode(rel)
}
\seealso{
	\code{\link{endNode}}
}