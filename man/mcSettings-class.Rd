\name{mcSettings-class}
\Rdversion{1.1}
\docType{class}
\alias{mcSettings}
\alias{mcSettings-class}
\alias{show,mcSettings-method}

\title{Class "mcSettings"  }
\description{	 This class of objects contains the information
  describing a monte carlo experiment, i.e. its settings.}
\section{Objects from the Class}{
  Objects can be created by calls of the form \code{mcSettings(...)}.
  These objects contain information on the number of repetitions of the
  experiments, the data used for training the models on each repetition,
  the  data used for testing these models, and the random number
  generator seed.
}
\section{Slots}{
  \describe{
    \item{\code{mcReps}:}{Object of class \code{"numeric"} indicating
      the number of repetitions of the monte carlo experiment (defaulting
      to 10). }
    \item{\code{mcTrain}:}{Object of class \code{"numeric"}. If it is a
      value between 0 and 1 it is interpreted as a percentage of the
      available data set, otherwise it is interpreted as the number of
      cases to use. It defaults to 0.25. }
    \item{\code{mcTest}:}{Object of class \code{"numeric"} If it is a
      value between 0 and 1 it is interpreted as a percentage of the
      available data set, otherwise it is interpreted as the number of
      cases to use. It defaults to 0.25. }
    \item{\code{mcSeed}:}{Object of class \code{"numeric"} with the
      random number generator seed (defaulting to 1234). }
  }
}
\section{Extends}{
Class \code{"\linkS4class{expSettings}"}, directly.
}
\section{Methods}{
  \describe{
    \item{show}{\code{signature(object = "mcSettings")}: method used to
      show the contents of a mcSettings object. }
	 }
}
\references{ Torgo, L. (2010) \emph{Data Mining using R: learning with case studies},
CRC Press (ISBN: 9781439810187). \url{http://www.dcc.fc.up.pt/~ltorgo/DataMiningWithR}  
}
\author{ Luis Torgo \email{ltorgo@dcc.fc.up.pt} }
\seealso{
  \code{\linkS4class{mcRun}},
   \code{\linkS4class{cvSettings}},
  \code{\linkS4class{loocvSettings}}, \code{\linkS4class{hldSettings}},\code{\linkS4class{bootSettings}}, \code{\linkS4class{expSettings}}
}
\examples{
showClass("mcSettings")
}
\keyword{classes}
