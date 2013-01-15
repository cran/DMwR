\name{cvRun-class}
\Rdversion{1.1}
\docType{class}
\alias{cvRun}
\alias{cvRun-class}
\alias{plot,cvRun,missing-method}
\alias{summary,cvRun-method}

\title{Class "cvRun" }
\description{	 This is the class of the objects holding the results of
  a cross validation experiment.}
\section{Objects from the Class}{
  Objects can be created by calls of the form \code{cvRun(...)}.
  The objects contain information on the learner evaluated in the CV
  experiment, the predictive task that was used, the cross validation settings,
  and the results of the experiment.
}
\section{Slots}{
  \describe{
    \item{\code{learner}:}{Object of class \code{"learner"} }
    \item{\code{dataset}:}{Object of class \code{"task"} }
    \item{\code{settings}:}{Object of class \code{"cvSettings"} }
    \item{\code{foldResults}:}{Object of class \code{"matrix"} with the
      results of the experiment. The rows represent the different
      iterations of the experiment while the columns the different statistics evaluated on each iteration.}
  }
}
\section{Methods}{
  \describe{
    \item{plot}{\code{signature(x = "cvRun", y = "missing")}: method
      used to visualize the results of the cross validation experiment. }
    \item{summary}{\code{signature(object = "cvRun")}: method used to
      obtain a summary of the results of the cross validation experiment. }
	 }
}
\references{ Torgo, L. (2010) \emph{Data Mining using R: learning with case studies},
CRC Press (ISBN: 9781439810187). \url{http://www.dcc.fc.up.pt/~ltorgo/DataMiningWithR}  
}
\author{ Luis Torgo \email{ltorgo@dcc.fc.up.pt} }
\seealso{
  \code{\link{crossValidation}}, \code{\linkS4class{cvSettings}},  \code{\linkS4class{hldRun}},\code{\linkS4class{loocvRun}},\code{\linkS4class{mcRun}},\code{\linkS4class{bootRun}},\code{\linkS4class{compExp}}
}
\examples{
showClass("cvRun")
}
\keyword{classes}
