importSample = function(graph, data) UseMethod("importSample")

importSample.default = function(x, ...) {
  stop("Invalid object. Must supply graph object.")
}

importSample.graph = function(graph, data) {
  stopifnot(is.character(data))
  clear(graph)
  
  if(data == "movies") {
    fpath = system.file("extdata", "movies.txt", package = "RNeo4j")
    
  } else {
    stop("As of now, only the movie dataset is available. Set data = 'movies'.")
  }
  query = readChar(fpath, file.info(fpath)$size)
  suppressMessages(cypher(graph, query))
}

