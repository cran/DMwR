\name{variants}
\alias{variants}

\title{
Generate variants of a learning system
}
\description{
The main goal of this function is to facilitate the generation of
different variants of a learning system. The idea is to be able to
supply several possible values for a set of parameters of the learner,
and then have the function to return a set of \code{learner} objects,
each consisting of one of the different possible combinations of the
variants. This function finds its use in the context of experimental
comparisons among learning systems, where we may actually be interested
in comparing different parameter settings for each of them.
}
\usage{
variants(sys, varsRootName = sys, as.is=NULL, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{sys}{
This is the string representing the name of the function of the base
learner from which variants should be generated.
}
  \item{varsRootName}{
By default the names given to each variant will be formed by
concatenating the base name of the learner with the terminations: ".v1",
".v2", and so on. This parameter allows you to supply a different base name.
}
  \item{as.is}{
This is a vector of parameter names (defaults to \code{NULL} that are
not to be used as source for system variants. This is useful for systems
that have parameters that accept as "legal" values sets (e.g. a vector)
and that we do not want the function \code{variants} to interprete as
source values for generating different system variants.
}
  \item{\dots}{
The function then accepts any number of named arguments, each with a set
of values. These named arguments are supposed to be the names of
arguments of the base learner, while the sets of values are the
alternatives that you want to consider in the variants generation (see
examples below).
}
}
\value{
  The result of this function is a list of \code{learner} objects. Each
  of these objects represents one of the parameter variants of the
  learner you have supplied.
}
\references{ Torgo, L. (2010) \emph{Data Mining using R: learning with case studies},
  CRC Press (ISBN: 9781439810187).

  \url{http://www.dcc.fc.up.pt/~ltorgo/DataMiningWithR}  
}
\author{ Luis Torgo \email{ltorgo@dcc.fc.up.pt} }

\seealso{
\code{\linkS4class{learner}},\code{\link{experimentalComparison}}
}
\examples{
## Generating several variants of the "rpartXse" learner using different
## values of the paramter "se"

variants('rpartXse',se=c(0,0.5,1))
}
\keyword{ models }
