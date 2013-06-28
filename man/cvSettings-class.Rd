\name{cvSettings-class}
\Rdversion{1.1}
\docType{class}
\alias{cvSettings}
\alias{cvSettings-class}
\alias{show,cvSettings-method}

\title{Class "cvSettings"}
\description{	This class of objects contains the information
  describing a cross validation experiment, i.e. its settings.}
\section{Objects from the Class}{
  Objects can be created by calls of the form \code{cvSettings(...)}.
  These objects include information on the number of repetitions of the
  experiment, the number of folds, the random number generator seed and
  whether the sampling should or not be stratefied.
}
\section{Slots}{
  \describe{
    \item{\code{cvReps}:}{Object of class \code{"numeric"} indicating
      the number of repetitions of the N folds CV experiment (defaulting
      to 1). }
    \item{\code{cvFolds}:}{Object of class \code{"numeric"} with the
      number of folds on each CV experiment (defaulting to 10). }
    \item{\code{cvSeed}:}{Object of class \code{"numeric"} with the
      random number generator seed (defaulting to 1234). }
    \item{\code{strat}:}{Object of class \code{"logical"} indicating
      whether the sampling should or not be stratified (defaulting to F). }
  }
}
\section{Extends}{
Class \code{"\linkS4class{expSettings}"}, directly.
}
\section{Methods}{
  \describe{
    \item{show}{\code{signature(object = "cvSettings")}: method used to
      show the contents of a cvSettings object. }
	 }
       }
\references{ Torgo, L. (2010) \emph{Data Mining using R: learning with case studies},
CRC Press (ISBN: 9781439810187). \url{http://www.dcc.fc.up.pt/~ltorgo/DataMiningWithR}  
}
\author{ Luis Torgo \email{ltorgo@dcc.fc.up.pt} }
\seealso{
  \code{\linkS4class{cvRun}},
   \code{\linkS4class{mcSettings}},
  \code{\linkS4class{loocvSettings}}, \code{\linkS4class{hldSettings}},\code{\linkS4class{bootSettings}}, \code{\linkS4class{expSettings}}
}
\examples{
showClass("cvSettings")
}
\keyword{classes}
