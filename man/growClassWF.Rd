\name{growClassWF}
\alias{growClassWF}

\title{
  A function implementing a growing  window workflows for nominal time series
  forecasting tasks
}
\description{
  This function implements a growing window workflows for the prediction of
  nominal time series. The growing window workflow consists of: (i) starting by
  learning a classification model based on the given training set, (ii) use
  this model to obtain predictions for a pre-defined number of future
  time steps; (iii) then  add the data of these already forecasted
  periods to the training set thus growing the training window  and
  obtain a new model with this new  training set; (iv) use this new
  model  for obtaining another set of  predictions; and (v) keep
  repeting this growing  process until predictions are obtained for  all
  test set period.
}
\usage{
growClassWF(...)
}

\arguments{
   \item{...}{
    Parameters passed to function \code{\link{tsRegrWF}}
  }
}
\details{
  The main goal of this function is to facilitate the task of the users
  of the experimental comparison infra-structure provided by function
  \code{\link{experimentalComparison}} for time series problems where
  the target variable is nominal, i.e. a sequence of time-ordered
  symbols.  This latter function requires
  the user to write down a function implementing each of the workflows
  to be evaluated/compared by the infra-structure through a Monte Carlo
  simulation process, which is the experimental methodology recommended
  for time series problems within this infra-structure. Frequently, users
  just want to compare existing algorithms or variants of these algorithms on a
  set of forecasting tasks, using some standard  error
  metrics. In these situations, it may be tedious  having to write these
  functions. The goal of the \code{growClassWF} function is to facilitate
  this task.

   This function implements a growing window workflow. The function
  essentially calls function \code{\link{tsClassWF}} with parameter
  \code{type} equals to 'grow'. Check the help page of this function for
  full details on this type of workflows, and which parameters you
  should include to specify the workflow.
}
\value{
  A named vector with the calculated statistics as returned by function \code{\link{class.eval}}.
}
\references{ Torgo, L. (2010) \emph{Data Mining using R: learning with case studies},
  CRC Press (ISBN: 9781439810187).

  \url{http://www.dcc.fc.up.pt/~ltorgo/DataMiningWithR}  
}
\author{ Luis Torgo \email{ltorgo@dcc.fc.up.pt} }
\note{
  In order to use any of the available classification algorithms you must
  have previously installed the respective packages if necessary.
}
\seealso{
 \code{\link{slideClassWF}}, \code{\link{tsClassWF}},
 \code{\link{experimentalComparison}},  \code{\link{growRegrWF}},
 \code{\link{slideRegrWF}},  \code{\link{classWF}}
}
\examples{

## The following is a small illustrative example using the quotes of the
## SP500 index. This example compares two random forests with 500
## classification trees, one applyed in a standard way, and the other using
## a growing window with a relearn step of every 5 days. The experiment
## uses 10 repetitions of a train+test cycle using 50\% of the available
## data for training and 25\% for testing. The target variable is a buy,
## hold or sell signal (a nominal variable), obtained according to the
## percentage movements of the close price
\dontrun{
library(quantmod)
getSymbols('^GSPC',from='2008-01-01',to='2012-12-31')
data.model <- specifyModel(
  Next(100*Delt(Ad(GSPC))) ~ Delt(Ad(GSPC),k=1:10)+Delt(Vo(GSPC),k=1:3))
data <- as.data.frame(modelData(data.model))
colnames(data)[1] <- 'signal'
data$signal <- trading.signals(data$signal,b.t=2.5,s.t=-2.5)
spExp <- experimentalComparison(
  c(dataset(signal ~ .,data[-nrow(data),],'SP500_2012')),
  c(standRF=learner('classWF',pars=list(learner='randomForest',
                                       ntree=500)),
    slideRF=learner('growClassWF',pars=list(learner='randomForest',
                                            ntree=500,relearn.step=5))),
  mcSettings(10,0.5,0.25))
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
