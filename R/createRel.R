createRel = function(.fromNode, .relType, .toNode, ...) {
  UseMethod("createRel")
}

createRel.default = function(x, ...) {
  stop("Invalid object. Must supply node object.")
}

createRel.node = function(.fromNode, .relType, .toNode, ...) {
  stopifnot(is.character(.relType), 
            "node" %in% class(.toNode))
  
  if(length(grep(" ", .relType)) > 0) {
    stop("Cannot have spaces in relationship types. Use UNDER_SCORES instead.")
  }
  
  header = setHeaders()
  
  fields = list(to = attr(.toNode, "self"), type = .relType)
  
  params = list(...)
  
  # If user supplied properties, append them to request.
  if(length(params) > 0)
    fields = c(fields, data = list(params))
  
  fields = toJSON(fields)
  url = attr(.fromNode, "create_relationship")
  response = http_request(url,
                          "POST",
                          "Created",
                          postfields = fields,
                          httpheader = header)

  result = fromJSON(response)
  class(result) = c("entity", "relationship")
  rel = configure_result(result, attr(graph, "username"), attr(graph, "password"))
  return(rel)
}