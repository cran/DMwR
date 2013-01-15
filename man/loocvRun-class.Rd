\name{loocvRun-class}
\Rdversion{1.1}
\docType{class}
\alias{loocvRun}
\alias{loocvRun-class}
\alias{summary,loocvRun-method}

\title{Class "loocvRun" }
\description{	This is the class of the objects holding the results of
  a leave one out cross validation experiment. }
\section{Objects from the Class}{
  Objects can be created by calls of the form \code{loocvRun(...)}.
  These objects contain information on the learner evaluated in the LOOCV
  experiment, the predictive task that was used, the leave one out cross validation settings,
  and the results of the experiment.
}
\section{Slots}{
  \describe{
    \item{\code{learner}:}{Object of class \code{"learner"} }
    \item{\code{dataset}:}{Object of class \code{"task"} }
    \item{\code{settings}:}{Object of class \code{"loocvSettings"} }
    \item{\code{foldResults}:}{Object of class \code{"matrix"} with the
      results of the experiment. The rows represent the different
      iterations of the experiment while the columns the different statistics evaluated on each iteration.}
  }
}
\section{Methods}{
  \describe{
    \item{summary}{\code{signature(object = "loocvRun")}:  method used to
      obtain a summary of the results of the leave one out cross validation experiment. }
	 }
}
\references{ Torgo, L. (2010) \emph{Data Mining using R: learning with case studies},
CRC Press (ISBN: 9781439810187). \url{http://www.dcc.fc.up.pt/~ltorgo/DataMiningWithR}  
}
\author{ Luis Torgo \email{ltorgo@dcc.fc.up.pt} }
\seealso{
  \code{\linkS4class{loocvSettings}},  \code{\linkS4class{hldRun}},\code{\linkS4class{cvRun}},\code{\linkS4class{mcRun}},\code{\linkS4class{bootRun}},\code{\linkS4class{compExp}}
}
\examples{
showClass("loocvRun")
}
\keyword{classes}
