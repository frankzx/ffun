#' Custom Knit function for RStudio
#'
#' This function customizes knitr output options.
#' It sets the outpot folder to up level folder output, (./output).
#' It generates .html file with date attached.
#'
#' @export

knit_date <- function(inputFile, ...) {

  # check if the original file name has date attached or not, if so, remove it
  if (gsub(".*(-.*-.*-.*)\\..*", "\\1", basename(inputFile)) == TRUE) {

    filename <- gsub("(.*)-.*-.*-.*\\..*", "\\1", basename(inputFile))
  }

  else {

    filename <- basename(inputFile)

  }

  # setup output folder
  output_dir <- '../output'

  rmarkdown::render(
    inputFile,
    output_file = paste0(filename, '-', Sys.Date(), '.html'),
    output_dir = output_dir)
}

