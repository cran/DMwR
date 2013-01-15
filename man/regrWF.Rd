\name{regrWF}
\alias{regrWF}

\title{
  A function implementing a standard workflow for regression tasks
}
\description{
  This function implements a standard workflow for a regression
  task. The workflow consists of: (i) learning a regression model based on the given
  training set, (ii) using it to make predictions for the provided test set,
  and finally  (iii) measuring some standard regression error metrics of its performance.
}
\usage{
regrWF(form,train,test,learner,eval=.RegrStats,simpl=F,...)
}

\arguments{
  \item{form}{
    A formula specifying the predictive task.
  }
  \item{train}{
    A data frame containing the data set to be used for obtaining the
    regression model (the training set).
  }
  \item{test}{
    A data frame containing the data set to be used for testing the
    obtained regression model (the test set).
  }
  \item{learner}{
    A character string containing the name of regression algorithm
    to use to obtain the regression model with the training set (see
    the Details section for the models currently available).
  }
  \item{eval}{
    A vector of character strings of the metrics that are to be
    calculated using the predictions of the obtained model. The allowed
    metrics are the ones available in function \code{\link{regr.eval}}
  (defaults to mean absolute error - "mae", and mean squared error - "mse")
  }
  \item{simpl}{
    This parameter is only used if the regression algorithm to be used
    is a linear regression model (\code{learner} = "lm"), and it is a
    logical indicating whether the resulting linear models should be
    simplified using the \code{step} function (defaults to \code{TRUE}).
  }
  \item{...}{
    Any extra arguments that will be passed to  the selected
    regression algorithm.
  }
}
\details{
  The main goal of this function is to facilitate the task of the users
  of the experimental comparison infra-structure provided by function
  \code{\link{experimentalComparison}}. This latter function requires
  the user to write down a function implementing each of the workflows
  to be evaluated/compared by the infra-structure. Frequently, users
  just want to compare existing algorithms or variants of these algorithms on a
  set of predictive tasks, using some standard regression error
  metrics. In these situations, it may be tedious to have to write these
  functions. The goal of the \code{regrWF} function is to facilitate
  this task.

  Through parameter \code{learner} users may indicate the regression
  algorithm to use in the workflow. The currently available options are:

  "rpartXse": a regression tree available on package \pkg{DMwR}
  based on the functions provided by package \pkg{rpart}.

  "svm": a support vector machine provided by function \code{svm} of
  package \pkg{e1071}.

  "ksvm": another support vector machine provided by function \code{ksvm} of
  package \pkg{kernlab}.

  "lm": a multiple linear regression model provided by function \code{lm} of
  package \pkg{stats}.

  "earth": a multivariate adaptive regression splines model provided by function \code{earth} of
  package \pkg{earth}.

  "randomForest": a random forest provided by function \code{randomForest} of
  package \pkg{randomForest}.

  "bagging": bagging provided by function \code{bagging} of
  package \pkg{ipred}.

  "gbm": a gradient boosting machine provided by function \code{gbm} of
  package \pkg{gbm}.

  "nnet": provided by function \code{nnet} of
  package \pkg{nnet}.
}
\value{
  A named vector with the calculated statistics as returned by function \code{\link{regr.eval}}.
}
\references{ Torgo, L. (2010) \emph{Data Mining using R: learning with case studies},
  CRC Press (ISBN: 9781439810187).

  \url{http://www.dcc.fc.up.pt/~ltorgo/DataMiningWithR}  
}
\author{ Luis Torgo \email{ltorgo@dcc.fc.up.pt} }
\note{
  In order to use any of the available regression algorithms you must
  have previously installed the respective packages if necessary.
}
\seealso{
 \code{\link{experimentalComparison}}, \code{\link{classWF}}, \code{\link{tsClassWF}}, \code{\link{tsRegrWF}}, \code{\link{growClassWF}}, \code{\link{slideClassWF}},  \code{\link{growRegrWF}}, \code{\link{slideRegrWF}}
}
\examples{
## Estimating the error rate on the Boston Housing data set of three variants
## (different pruning levels) of a regression tree through 10-fold
## cross validation
\dontrun{
data(Boston,package='MASS')
res <- experimentalComparison(
         c(dataset(medv ~ .,Boston)),
         variants('regrWF',learner='rpartXse',se=c(0,0.5,1)),
         cvSettings(1,10,123))
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
