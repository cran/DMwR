\name{monteCarlo}
\alias{monteCarlo}

\title{
Run a Monte Carlo experiment
}
\description{
  This function performs a Monte Carlo experiment with the goal of
  estimating the performance of a learner on a data set. This is a
  generic function in the sense that it can be used with any learner,
  data set and performance metrics. This is achieved by requiring the
  user to supply a function that takes care of the learning, testing and
  evaluation of the learner. This function is called  for each iteration
  of the Monte Carlo experiment.  
}
\usage{
monteCarlo(learner, data.set, mcSet, itsInfo = F, verbose = T)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{learner}{
    This is an object of the class \code{learner} (type "class?learner"
    for details) representing the system to evaluate. 
  }
  \item{data.set}{
    This is an object of the class \code{dataset} (type "class?dataset"
    for details) representing the data  set to be used in the
    evaluation. 
  }
  \item{mcSet}{
    This is an object of the class \code{mcSettings} (type "class?mcSettings"
    for details) with the experimental settings of the Monte Carlo
    experiment. 
  }
  \item{itsInfo}{
    Boolean value determining whether the object returned by the function
    should include as an attribute a list with as many components as there
    are iterations in the experimental process, with each component
    containing information that the user-defined function decides to
    return on top of the standard error statistics. See the Details
    section for more information.
  }
  \item{verbose}{
    A boolean value controlling the level of output of the function
    execution, defaulting to \code{TRUE}
  }
}
\details{
  This function estimates a set of evaluation statistics through a Monte
  Carlo experiment. The user supplies a learning system and a data set,
  together with the experiment settings. These settings should specify,
  among others, the size of the training (TR) and testing sets (TS) and the number
  of repetitions (R) of the train+test cycle. The function randomly selects
  a set of R numbers in the interval [TR+1,NDS-TS+1], where NDS is the
  size of the data set. For each of these R numbers the previous TR
  observations of the data set are used to learn a model and the
  subsequent TS observations for testing it and obtaining the wanted
  evaluation statistics. The resulting R estimates of the evaluation
  statistics are averaged at the end of this process resulting in the
  Monte Carlo estimates of these metrics.
  
  This function is particularly adequate for obtaining estimates of
  performance for time series prediction problems. The reason is that
  the experimental repetitions ensure that the order of the rows in the
  original data set are never swaped. If this order is related to time
  stamps, as is the case in time series, this is an important issue to
  ensure that a prediction model is never tested on past observations of
  the time series.
  
  If the \code{itsInfo} parameter is set to the value
  \verb{TRUE} then the \code{hldRun} object that is the result
  of the function will have an attribute named \verb{itsInfo}
  that will contain extra information from the individual repetitions of
  the hold out process. This information can be accessed by the user by
  using the function \code{attr()},
  e.g. \verb{attr(returnedObject,'itsInfo')}. For this
  information to be collected on this attribute the user needs to code
  its user-defined functions in a way that it returns the vector of the
  evaluation statistics with an associated attribute named
  \verb{itInfo} (note that it is "itInfo" and not "itsInfo" as
  above), which should be a list containing whatever information the
  user wants to collect on each repetition. This apparently complex
  infra-structure allows you to pass whatever information you which from
  each iteration of the experimental process. A typical example is the
  case where you want to check the individual predictions of the model
  on each test case of each repetition. You could pass this vector of
  predictions as a component of the list forming the attribute
  \verb{itInfo} of the statistics returned by your user-defined
  function. In the end of the experimental process you will be able to
  inspect/use these predictions by inspecting the attribute
  \verb{itsInfo} of the \code{mcRun} object returned by the
  \code{monteCarlo()} function. See the Examples section on the help page
  of the function \code{holdout()} for an
  illustration of this potentiality.
}
\value{
  The result of the function is an object of class \code{mcRun}.
}
\references{ Torgo, L. (2010) \emph{Data Mining using R: learning with case studies},
  CRC Press (ISBN: 9781439810187).

  \url{http://www.dcc.fc.up.pt/~ltorgo/DataMiningWithR}  
}
\author{ Luis Torgo \email{ltorgo@dcc.fc.up.pt} }

\seealso{
\code{\link{experimentalComparison}},
\code{\linkS4class{mcRun}},\code{\linkS4class{mcSettings}},
\code{\link{tsRegrWF}}, \code{\link{slideRegrWF}},
\code{\link{growRegrWF}}, \code{\link{tsClassWF}},
\code{\link{slideClassWF}}, \code{\link{growClassWF}},
\code{\link{crossValidation}},  \code{\link{holdOut}},
\code{\link{loocv}}, \code{\link{bootstrap}}
}
\examples{

## The following is a small illustrative example using the quotes of the
## SP500 index. This example compares two random forests with 500
## regression trees, one applyed in a standard way, and the other using
## a growing window with a relearn step of every 5 days. The experiment
## uses 10 repetitions of a train+test cycle using 50\% of the available
## data for training and 25\% for testing.
\dontrun{
library(quantmod)
getSymbols('^GSPC',from='2008-01-01',to='2012-12-31')
data.model <- specifyModel(
  Next(100*Delt(Ad(GSPC))) ~ Delt(Ad(GSPC),k=1:10)+Delt(Vo(GSPC),k=1:3))
data <- as.data.frame(modelData(data.model))
colnames(data)[1] <- 'PercVarClose'
spExp <- experimentalComparison(
  c(dataset(PercVarClose ~ .,data,'SP500_2012')),
  c(standRF=learner('regrWF',pars=list(learner='randomForest',
                                       ntree=500)),
    growRF=learner('growRegrWF',pars=list(learner='randomForest',
                                          ntree=500,relearn.step=5))),
  mcSettings(10,0.5,0.25))
summary(spExp)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }

