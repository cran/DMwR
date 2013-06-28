\name{hldSettings-class}
\Rdversion{1.1}
\docType{class}
\alias{hldSettings}
\alias{hldSettings-class}
\alias{show,hldSettings-method}

\title{Class "hldSettings" }
\description{	 This class of objects contains the information
  describing a hold out experiment, i.e. its settings.}
\section{Objects from the Class}{
  Objects can be created by calls of the form \code{hldSettings(...)}.
  The objects contain information on the number of repetitions of the
  hold out experiment, the percentage of the given data to set as hold
  out test set, the random number generator seed and information on
  whether stratified sampling should be used.
}
\section{Slots}{
  \describe{
    \item{\code{hldReps}:}{Object of class \code{"numeric"} indicating
      the number of repetitions of the N folds CV experiment (defaulting
      to 1). }
    \item{\code{hldSz}:}{Object of class \code{"numeric"} with the
      percentage (a number between 0 and 1) of cases to use as hold out
      (defaulting to 0.3).}
    \item{\code{hldSeed}:}{Object of class \code{"numeric"} with the
      random number generator seed (defaulting to 1234). }
    \item{\code{strat}:}{Object of class \code{"logical"} indicating
      whether the sampling should or not be stratefied (defaulting to F). }
  }
}
\section{Extends}{
Class \code{"\linkS4class{expSettings}"}, directly.
}
\section{Methods}{
  \describe{
    \item{show}{\code{signature(object = "hldSettings")}: method used to
      show the contents of a hldSettings object. }
	 }
}
\references{ Torgo, L. (2010) \emph{Data Mining using R: learning with case studies},
CRC Press (ISBN: 9781439810187). \url{http://www.dcc.fc.up.pt/~ltorgo/DataMiningWithR}  
}
\author{ Luis Torgo \email{ltorgo@dcc.fc.up.pt} }
\seealso{
  \code{\linkS4class{hldRun}},
   \code{\linkS4class{mcSettings}},
  \code{\linkS4class{loocvSettings}}, \code{\linkS4class{cvSettings}},\code{\linkS4class{bootSettings}}, \code{\linkS4class{expSettings}}
}
\examples{
showClass("hldSettings")
}
\keyword{classes}
