\name{slidingWindowTest}
\alias{slidingWindowTest}

\title{
  Obtain the predictions of a model using a sliding window learning approach.
}
\description{
  This function implements the sliding window learning method that is
  frequently used in time series forecasting. The function allows
  applying this methodology to any modelling technique. The function
  returns the predictions of this technique, when applied using a sliding
  window approach, for the given test set.
}
\usage{
slidingWindowTest(learner, form, train, test, relearn.step = 1, verbose = T)
}

\arguments{
  \item{learner}{
    This is an object of the class \code{learner} (type "class?learner"
    for details) representing the system to evaluate. 
}
\item{form}{
  A formula describing the prediction problem.
}
\item{train}{
  A data frame with the initial training data.  The size of this
  training set will also determine the size of the sliding window.
}
\item{test}{
  A data frame with the test set for which we want predictions.
}
\item{relearn.step}{
  A number indicating the number of test cases until a new model is
  re-learned by sliding the training window to cases that are nearest to
  the current test case.
}
\item{verbose}{
  A boolean determining the level of verbosity of the function.
}
}
\details{
  The sliding window is a method frequently used to handle time series
  prediction problems. The basic motivation is that as time goes by the data gets "old"
  and thus the models should be re-learned to re-adjust for "fresher" data. This
  function implements this general idea for any modelling technique.

  The function receives an initial training set whose size will
  determine the size of the sliding window. Using this initial set a
  first model is obtained with the supplied modelling technique. This
  model is applied to obtain predictions for the first
  \code{relearn.step} test cases. Afterwards a new model is obtained
  with the more recent training cases. This new set will have the same
  size as the initially provided training set. It is thus as if the
  training set slided forward \code{relearn.step} observations. This
  second model is again used to obtain predictions for another set of
  \code{relearn.step} test cases. The sliding process keeps going until
  we obtain predictions for all provided test cases.

}
\value{
  A vector with the predictions for the test set. Note that if the
  target variable is a factor this vector will also be a factor.
}
\references{ Torgo, L. (2010) \emph{Data Mining using R: learning with case studies},
  CRC Press (ISBN: 9781439810187).

  \url{http://www.liaad.up.pt/~ltorgo/DataMiningWithR}  
}
\author{ Luis Torgo \email{ltorgo@dcc.fc.up.pt} }

\seealso{
\code{\link{growingWindowTest}},\code{\link{monteCarlo}}
}
\examples{
data(swiss)

## Obtain the predictions of model rpartXse() for the last 22 rows of
## the swiss data set, when used with a sliding window of 25 cases with
## a relearning step of 3

## The base learner used in the experiment
learnAndTest.rpartXse <- function(form, train, test, ...) {
    model <- rpartXse(form, train, ...)
    predict(model, test)
}

preds <- slidingWindowTest(learner('learnAndTest.rpartXse',pars=list(se=0.5)),
                           Infant.Mortality ~ .,
                           swiss[1:25,],
                           swiss[26:nrow(swiss),],
                           3)

## Some statistics of these predictions
regr.eval(swiss[26:nrow(swiss),'Infant.Mortality'],preds,stats = c("mae", "mse", "rmse"))
}

\keyword{ models }

