# ribd 1.1.0

* New function `constructPedigree()`, which constructs a pedigree yielding a prescribed set of IBD coefficients. This implements the algorithm described in https://doi.org/10.1007/s00285-020-01505-x.  

* `kinship()` gains a new argument `ids`, which is handy when you only want the kinship coefficient between two individuals (and not the whole kinship matrix)

* Similarly, `inbreeding()` gains the argument `id` for computing the inbreeding coefficient of a single individual.


# ribd 1.0.1

* This is a minor release, resolving a CRAN request to fix a documentation issue.

# ribd 1.0.0

* Initial CRAN release
