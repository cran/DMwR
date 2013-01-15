\name{runLearner}
\alias{runLearner}

\title{
  Run a Learning Algorithm
}
\description{
  This function can be used to run a learning algorithm whose details
  are stored in a \code{learner} class object.
}
\usage{
runLearner(l, ...)
}

\arguments{
  \item{l}{
\code{l} is an object of class learner containing the information on the
learning algorithm.
}
  \item{\dots}{
\code{\dots} represent any other parameters that are passed to the
execution of the learning algorithm.
}
}
%%\details{
%%  ~~ If necessary, more details than the description above ~~
%%}
\value{
  The value returned by the function is the object that results from the
  execution of the learning algorithm.
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{ Torgo, L. (2010) \emph{Data Mining using R: learning with case studies},
  CRC Press (ISBN: 9781439810187).

  \url{http://www.dcc.fc.up.pt/~ltorgo/DataMiningWithR}  
}
\author{ Luis Torgo \email{ltorgo@dcc.fc.up.pt} }
\seealso{
\code{\linkS4class{learner}}
}
\examples{
## Run multiple linear regression on the Swiss data set.
data(swiss)
lrn <- learner('lm',pars=list())
runLearner(lrn,Infant.Mortality ~ .,swiss)

\dontrun{library(nnet)
lrn2 <- learner('nnet',pars=list(size=4,decay=0.1,linout=TRUE))
runLearner(lrn2,Infant.Mortality ~ .,swiss)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }

