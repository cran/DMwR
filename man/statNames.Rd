\name{statNames}
\alias{statNames}

\title{
  Obtain the name of the statistics involved in an experimental comparison
}
\description{
  This function produces a vector with the names of the statistics that
  were estimated in an experimental comparison
}
\usage{
statNames(res)
}

\arguments{
  \item{res}{
This is a \code{compExp} object (type "class?compExp" for details)
    that contains the results of an experimental comparison obtained
    through the \code{experimentalComparison()} function. 
}
}
\value{
  A vector of strings with the names of the statistics
}
\references{ Torgo, L. (2010) \emph{Data Mining using R: learning with case studies},
  CRC Press (ISBN: 9781439810187).

  \url{http://www.dcc.fc.up.pt/~ltorgo/DataMiningWithR}  
}
\seealso{
\code{\link{learnerNames}}, \code{\link{dsNames}},\code{\link{experimentalComparison}}
}
\keyword{ models }
