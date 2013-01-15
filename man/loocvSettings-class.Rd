\name{loocvSettings-class}
\Rdversion{1.1}
\docType{class}
\alias{loocvSettings}
\alias{loocvSettings-class}
\alias{show,loocvSettings-method}

\title{Class "loocvSettings"  }
\description{	This class of objects contains the information
  describing a leave one out cross validation experiment, i.e. its settings. }
\section{Objects from the Class}{
  Objects can be created by calls of the form \code{loocvSettings(...)}.
  These objects contain infoprmation on the random number generator seed
  and also whether the execution of the experiments should be verbose.
}
\section{Slots}{
  \describe{
    \item{\code{loocvSeed}:}{Object of class \code{"numeric"} with the
      random number generator seed (defaulting to 1234). }
    \item{\code{verbose}:}{Object of class \code{"logical"} indicating
      whether the execution of the experiments should be verbose (defaulting to F). }
  }
}
\section{Extends}{
Class \code{"\linkS4class{expSettings}"}, directly.
}
\section{Methods}{
  \describe{
    \item{show}{\code{signature(object = "loocvSettings")}: method used to
      show the contents of a loocvSettings object. }
	 }
}
\references{ Torgo, L. (2010) \emph{Data Mining using R: learning with case studies},
CRC Press (ISBN: 9781439810187). \url{http://www.dcc.fc.up.pt/~ltorgo/DataMiningWithR}  
}
\author{ Luis Torgo \email{ltorgo@dcc.fc.up.pt} }
\seealso{
  \code{\linkS4class{loocvRun}},
   \code{\linkS4class{mcSettings}},
  \code{\linkS4class{cvSettings}}, \code{\linkS4class{hldSettings}},\code{\linkS4class{bootSettings}}, \code{\linkS4class{expSettings}}
}
\examples{
showClass("loocvSettings")
}
\keyword{classes}
