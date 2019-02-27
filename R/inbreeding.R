#' Inbreeding coefficients
#'
#' Compute the inbreeding coefficients of all members of a pedigree. This is a
#' wrapper of [kinship()] which does the main work. The founders may be
#' inbred; see [pedtools::founderInbreeding()] for how to set this up.
#'
#' The inbreeding coefficient of a pedigree member is defined as the probability
#' that, at a random autosomal locus, the two alleles carried by the member are
#' identical by descent relative to the pedigree. It follows from the definition
#' that the inbreeding coefficient of a member equals the kinship coefficient of
#' the parents.
#'
#' @param x A pedigree, in the form of a [`pedtools::ped`] object.
#'
#' @return A vector of length `pedsize(x)`.
#'
#' @seealso [kinship()]
#' @examples
#' # Child of half siblings: f = 1/8
#' x = halfCousinPed(0, child = TRUE)
#' inbreeding(x)
#'
#' # If the father is 100% inbred, the inbreeding coeff of the child doubles
#' founderInbreeding(x, 1) = 1
#' inbreeding(x)
#'
#' @export
inbreeding = function(x) {
  kin.matrix = kinship(x)

  # Initialize result vector
  inb = numeric(pedsize(x))
  names(inb) = labels(x)

  # Fill in founder inbreeding
  inb[founders(x)] = founderInbreeding(x)

  # Non-founders
  inb[nonfounders(x)] = kin.matrix[cbind(x$FIDX, x$MIDX)] # founders -> kin[0,0] -> excluded

  inb
}