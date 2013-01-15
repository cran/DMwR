\name{dsNames}
\alias{dsNames}

\title{
  Obtain the name of the data sets involved in an experimental comparison
}
\description{
  This function produces a vector with the names of the datasets
  involved in an experimental comparison
}
\usage{
dsNames(res)
}

\arguments{
  \item{res}{
This is a \code{compExp} object (type "class?compExp" for details)
    that contains the results of an experimental comparison obtained
    through the \code{experimentalComparison()} function. 
}
}
\value{
  A vector of strings with the names of the datasets
}
\references{ Torgo, L. (2010) \emph{Data Mining using R: learning with case studies},
  CRC Press (ISBN: 9781439810187).

  \url{http://www.dcc.fc.up.pt/~ltorgo/DataMiningWithR}  
}
\seealso{
\code{\link{learnerNames}}, \code{\link{statNames}},\code{\link{experimentalComparison}}
}
\keyword{ models }
