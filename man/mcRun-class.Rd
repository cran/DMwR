\name{mcRun-class}
\Rdversion{1.1}
\docType{class}
\alias{mcRun}
\alias{mcRun-class}
\alias{plot,mcRun,missing-method}
\alias{summary,mcRun-method}

\title{Class "mcRun" }
\description{	 This is the class of the objects holding the results of
  a monte carlo experiment.}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{mcRun(...)}.
  The objects contain information on the learner evaluated in the monte carlo
  experiment, the predictive task that was used, the monte carlo settings,
  and the results of the experiment.
}
\section{Slots}{
  \describe{
    \item{\code{learner}:}{Object of class \code{"learner"} }
    \item{\code{dataset}:}{Object of class \code{"task"} }
    \item{\code{settings}:}{Object of class \code{"mcSettings"} }
    \item{\code{foldResults}:}{Object of class \code{"matrix"} with the
      results of the experiment. The rows represent the different
      iterations of the experiment while the columns the different statistics evaluated on each iteration.}
  }
}
\section{Methods}{
  \describe{
    \item{plot}{\code{signature(x = "mcRun", y = "missing")}: method
      used to visualize the results of the monte carlo experiment. }
    \item{summary}{\code{signature(object = "mcRun")}: method used to
      obtain a summary of the results of the monte carlo experiment. }
	 }
}
\references{ Torgo, L. (2010) \emph{Data Mining using R: learning with case studies},
CRC Press (ISBN: 9781439810187). \url{http://www.dcc.fc.up.pt/~ltorgo/DataMiningWithR}  
}
\author{ Luis Torgo \email{ltorgo@dcc.fc.up.pt} }
\seealso{
  \code{\linkS4class{mcSettings}},  \code{\linkS4class{hldRun}},\code{\linkS4class{loocvRun}},\code{\linkS4class{cvRun}},\code{\linkS4class{bootRun}},\code{\linkS4class{compExp}}
}
\examples{
showClass("mcRun")
}
\keyword{classes}
