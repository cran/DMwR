\name{bootRun-class}
\Rdversion{1.1}
\docType{class}
\alias{bootRun}
\alias{bootRun-class}
\alias{summary,bootRun-method}

\title{Class "bootRun" }
\description{	 This is the class of the objects storing the results of
  a bootstrap experiment.}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{bootRun(...)}.
  The objects contain information on the learner evaluated in the holdout
  experiment, the predictive task that was used, the holdout settings,
  and the results of the experiment.
}
\section{Slots}{
  \describe{
    \item{\code{learner}:}{Object of class \code{"learner"}  }
    \item{\code{dataset}:}{Object of class \code{"task"}  }
    \item{\code{settings}:}{Object of class \code{"bootSettings"} }
    \item{\code{foldResults}:}{Object of class \code{"matrix"} with the
      results of the experiment. The rows represent the different
      repetitions of the experiment while the columns the different statistics evaluated on each iteration. }
  }
}
\section{Methods}{
  \describe{
    \item{summary}{\code{signature(object = "bootRun")}: method used to
      obtain a summary of the results of the holdout experiment. }
	 }
}
\references{ Torgo, L. (2010) \emph{Data Mining using R: learning with case studies},
CRC Press (ISBN: 9781439810187). \url{http://www.dcc.fc.up.pt/~ltorgo/DataMiningWithR}  
}
\author{ Luis Torgo \email{ltorgo@dcc.fc.up.pt} }
\seealso{
  \code{\linkS4class{bootSettings}},  \code{\linkS4class{cvRun}},\code{\linkS4class{loocvRun}},\code{\linkS4class{mcRun}},\code{\linkS4class{hldRun}},\code{\linkS4class{compExp}}
}
\examples{
showClass("bootRun")
}
\keyword{classes}
