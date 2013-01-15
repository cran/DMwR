\name{bootSettings-class}
\Rdversion{1.1}
\docType{class}
\alias{bootSettings}
\alias{bootSettings-class}
\alias{show,bootSettings-method}

\title{Class "bootSettings" }
\description{	 This class of objects contains the information
  describing a bootstrap experiment, i.e. its settings.}
\section{Objects from the Class}{
  Objects can be created by calls of the form \code{bootSettings(...)}.
  The objects contain information on the random number generator seed
  and on the number of repetitons of the boostrap process.
}
\section{Slots}{
  \describe{
    \item{\code{bootSeed}:}{Object of class \code{"numeric"}with the
      random number generator seed (defaulting to 1234). }
    \item{\code{bootReps}:}{Object of class \code{"numeric"} indicating
      the number of repetitions of the bootstrap experiment (defaulting
      to 50). }
  }
}
\section{Extends}{
Class \code{"\linkS4class{expSettings}"}, directly.
}
\section{Methods}{
  \describe{
    \item{show}{\code{signature(object = "bootSettings")}: method used to
      show the contents of a bootSettings object.  }
	 }
}
\references{ Torgo, L. (2010) \emph{Data Mining using R: learning with case studies},
CRC Press (ISBN: 9781439810187). \url{http://www.dcc.fc.up.pt/~ltorgo/DataMiningWithR}  
}
\author{ Luis Torgo \email{ltorgo@dcc.fc.up.pt} }
\seealso{
  \code{\linkS4class{bootRun}},
   \code{\linkS4class{mcSettings}},
  \code{\linkS4class{loocvSettings}}, \code{\linkS4class{cvSettings}},\code{\linkS4class{hldSettings}}, \code{\linkS4class{expSettings}}
}
\examples{
showClass("bootSettings")
}
\keyword{classes}
