#' Replace double quotes with single quotes
#'
#' @examples
#' style_text("'here is a string'", style = quote_style)
#' @param pd_flat A flat parse table.
#' @keywords internal
fix_quote <- function(pd_flat) {
  str_const <- which(pd_flat$token == 'STR_CONST')
  if (rlang::is_empty(str_const)) {
    return(pd_flat)
  }
  pd_flat$text[str_const] <- purrr::map(pd_flat$text[str_const], fix_quote_two)
  pd_flat
}

#' Make a double quote single
#' @keywords internal
fix_quote_two <- function(x) {
  rx <- '^"([^\']*)"$'
  i <- grep(rx, x)
  if (rlang::is_empty(i)) {
    return(x)
  }

  # replace outer single quotes
  xi <- gsub(rx, "'\\1'", x[i])

  # Replace inner escaped quotes (\') by ' and keep all other instances of \., including \\
  x[i] <- gsub('\\\\(")|(\\\\[^"])', '\\1\\2', xi)
  x
}
