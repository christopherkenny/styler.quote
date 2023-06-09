% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/style-guides.R
\name{quote_style}
\alias{quote_style}
\title{The quote style}
\usage{
quote_style(
  scope = "tokens",
  strict = TRUE,
  indent_by = 2,
  start_comments_with_one_space = FALSE,
  reindention = tidyverse_reindention(),
  math_token_spacing = tidyverse_math_token_spacing()
)
}
\arguments{
\item{scope}{The extent of manipulation. Can range from "none" (least
invasive) to "tokens" (most invasive). See 'Details'. This argument is a
string or a vector of class \code{AsIs}.}

\item{strict}{A logical value indicating whether a set of strict
or not so strict transformer functions should be returned. Compare the
functions returned with or without \code{strict = TRUE}. For example,
\code{strict = TRUE} means force \emph{one} space e.g. after "," and \emph{one} line break
e.g. after a closing curly brace. \code{strict = FALSE} means to set spaces and
line breaks to one if there is none and leave the code untouched otherwise.
See 'Examples'.}

\item{indent_by}{How many spaces of indention should be inserted after
operators such as '('.}

\item{start_comments_with_one_space}{Whether or not comments should start
with only one space (see \code{\link[styler:start_comments_with_space]{start_comments_with_space()}}).}

\item{reindention}{A list of parameters for regex re-indention, most
conveniently constructed using \code{\link[styler:specify_reindention]{specify_reindention()}}.}

\item{math_token_spacing}{A list of parameters that define spacing around
math token, conveniently constructed using \code{\link[styler:specify_math_token_spacing]{specify_math_token_spacing()}}.}
}
\description{
Style code according to the quote style guide. For more
details and docs, see the \code{\link[styler:tidyverse_style]{styler::tidyverse_style()}}.
}
\examples{
style_text('call( 1)', scope = 'spaces')
}
\concept{obtain transformers}
\concept{style_guides}
