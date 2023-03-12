
<!-- README.md is generated from README.Rmd. Please edit that file -->

# styler.quote

<!-- badges: start -->
<!-- badges: end -->

`styler.quote` implements a single-quote variant of the tidyverse style
guide. It isn’t much different, but think about how many extra button
presses you save by not pressing <kbd>shift</kbd> + <kdb>‘</kdb> and
instead pressing just <kbd>’</kbd>. It is a third-party style guide for
[`styler`](https://styler.r-lib.org). This repo is based on
[lorenzwalthert/styler.yours](https://github.com/lorenzwalthert/styler.yours).

## Installation

You can install the development version of `styler.quote` like so:

``` r
remotes::install_github('christopherkenny/styler.quote')
```

## Example

This is a basic example of how to style code with it.

``` r
library(styler.quote)
cache_deactivate()
text <- 'x <- 4
y = 3
"a";
'

style_text(text)
```
