\name{task-class}
\Rdversion{1.1}
\docType{class}
\alias{task}
\alias{task-class}
\alias{show,task-method}

\title{Class "task" }
\description{	 This is an auxiliary class that is part of the
  representation of the \code{\linkS4class{dataset}} class. Objects of
  the task class do not actually store the data - they simply store
  information on the name of the predictive task in question as well as
  the respective formula.}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{task(...)}.
	 The objects include information on the name to be given to the
	 predictive task and also the associated formula.
}
\section{Slots}{
  \describe{
    \item{\code{name}:}{String character with the name of the predictive
      taks}
    \item{\code{formula}:}{R formula describing the task}
  }
}
\section{Methods}{
  \describe{
    \item{show}{\code{signature(object = "task")}: method used to
      show the contents of a task object. }
	 }
}
\references{ Torgo, L. (2010) \emph{Data Mining using R: learning with case studies},
CRC Press (ISBN: 9781439810187). \url{http://www.dcc.fc.up.pt/~ltorgo/DataMiningWithR}  }
\author{ Luis Torgo (ltorgo@dcc.fc.up.pt)  }

\seealso{
	\code{\linkS4class{learner}}, \code{\linkS4class{dataset}}
}
\examples{
showClass("task")
}
\keyword{classes}
