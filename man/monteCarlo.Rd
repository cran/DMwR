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
  \code{\linkS4class{mcRun}},
  \code{\linkS4class{mcSettings}},
  \code{\link{slidingWindowTest}}, \code{\link{growingWindowTest}},
  \code{\link{crossValidation}}, \code{\link{holdOut}}, \code{\link{loocv}}, \code{\link{bootstrap}}

}
\examples{
## The following is an example of a possible approach to a time series
## problem, although in this case the used data is clearly not a time
## series being selected only for illustration purposes

data(swiss)


## The base learner used in the experiment
mc.rpartXse <- function(form, train, test, ...) {
    model <- rpartXse(form, train, ...)
    preds <- predict(model, test)
    regr.eval(resp(form, test), preds,
              stats=c('mae','nmse'), train.y=resp(form, train))
}

## Estimate the MAE and NMSE of the learner rpartXse when asked to
## obtain predictions for a test set with 10 observations given a
## training set with 20 observations. The predictions for the 10
## observations are obtained using a sliding window learn+test approach
## (see the help of function slidingWindowTest() ) with a
## model re-learning step of 5 observations.
## Estimates are obtained by repeating 10 times the train+test process

x <- monteCarlo(learner("slidingWindowTest",
                      pars=list(learner=learner("mc.rpartXse",pars=list(se=1)),
                                relearn.step=5
                               )
                        ),
                      dataset(Infant.Mortality ~ ., swiss),
                      mcSettings(10,20,10,1234)
                 )

summary(x)
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }

