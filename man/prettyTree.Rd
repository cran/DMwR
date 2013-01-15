\name{prettyTree}
\alias{prettyTree}

\title{
Visual representation of a tree-based model
}
\description{
 This function plots a tree-based model, i.e. a \code{rpart} object
}
\usage{
prettyTree(t, compress = F, branch = 0.2, margin = 0.1, uniform = T,
           all = T, cex = 0.8, font = 10, use.n = T, fwidth = 0.5,
           fheight = 0.45, center = 0, ...)
}

\arguments{
  \item{t}{
A \code{rpart} object
}
  \item{compress}{
A boolean parameter passed to \code{plot.rpart()}. See the help page of
  this function for further details. Defaults to F.
}
  \item{branch}{
A numeric parameter passed to \code{plot.rpart()}. See the help page of
  this function for further details. Defaults to 0.2.
}
  \item{margin}{
A numeric parameter passed to \code{plot.rpart()}. See the help page of
  this function for further details. Defaults to 0.1.

}
  \item{uniform}{
A boolean parameter passed to \code{plot.rpart()}. See the help page of
  this function for further details. Defaults to T.

}
  \item{all}{
A boolean parameter passed to \code{text.rpart()}. See the help page of
  this function for further details. Defaults to T.

}
  \item{cex}{
A number controling the character size. Defaults to 0.8.
}
\item{font}{
  A number setting the base font size in points. Defaults to 10.
}
  \item{use.n}{
A boolean parameter passed to \code{text.rpart()}. See the help page of
  this function for further details. Defaults to T.

}
  \item{fwidth}{
A numeric parameter passed to \code{text.rpart()}. See the help page of
  this function for further details. Defaults to 0.5.

}
  \item{fheight}{
A numeric parameter passed to \code{text.rpart()}. See the help page of
  this function for further details. Defaults to 0.45.

}
  \item{center}{
A numeric parameter controlling drawing of ellipses. Defaults to 0.
}
  \item{\dots}{
Further parameters passed both to \code{plot.rpart()} and \code{text.rpart()}
}
}
\details{
  This function achieves the same functionallity as applying the
  function \code{plot()} and then the function \code{text()} to a
  \code{rpart} object: it essentially obtains a graphical representation
  of a tree-based model. The basic differences are related to visual
  formatting of the trees.
}
\references{
  Therneau, T. M. and Atkinson, B.; port by Brian
  Ripley. (2010). \emph{rpart: Recursive Partitioning}. R package version
  3.1-46.
  

Torgo, L. (2010) \emph{Data Mining using R: learning with case studies},
  CRC Press (ISBN: 9781439810187).

  \url{http://www.dcc.fc.up.pt/~ltorgo/DataMiningWithR}  

}
\author{ Luis Torgo \email{ltorgo@dcc.fc.up.pt} }
\seealso{
\code{\link{plot.rpart}}, \code{\link{text.rpart}},
\code{\link{rpartXse}}, \code{\link{rpart}}
}
\examples{
data(iris)
tree <- rpartXse(Species ~ ., iris)
\dontrun{
prettyTree(tree)
prettyTree(tree,all=F,use.n=F,branch=0)
}
}

\keyword{models}

