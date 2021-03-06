appendCypher = function(transaction, query, ...) UseMethod("appendCypher")

appendCypher.default = function(x) {
  stop("Invalid object. Must supply transaction object.")
}

appendCypher.transaction = function(transaction, query, ...) {
  stopifnot(is.character(query),
            length(query) == 1)
  
  url = transaction$location
  header = setHeaders()
  params = list(...)
  fields = list(statement = query)
  
  if(length(params) > 0) {
    fields = c(fields, parameters = list(params))
  }
  
  postfields = paste0("{\"statements\":[", toJSON(fields), "]}")
  
  http_request(url,
               "POST",
               "OK",
               postfields = postfields,
               httpheader = header)
  
  return(invisible(NULL))
}