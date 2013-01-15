\name{tsClassWF}
\alias{tsClassWF}

\title{
  A function implementing sliding and growing window workflows for nominal time series
  forecasting tasks
}
\description{
  This function implements sliding and growing window workflows for the prediction of
  nominal time series. The sliding window workflow consists of: (i) starting by
  learning a classification model based on the given training set, (ii) use
  this model to obtain predictions for a pre-defined number of future
  time steps; (iii) then  slide the training window forward this
  pre-defined number of steps and obtain a new model with this new
  training set; (iv) use this new model for obtaining another set of
  predictions; and (v) keep repeting this sliding process until
  predictions are obtained for all test set period.

  The growing window workflow is similar but instead of sliding the
  training window, we grow this window, so each new set of predictions
  is obtained with a model learned with all data since the beginning of
  the training set till the current time step. 
}
\usage{
tsClassWF(form,train,test,
          type,learner,eval=.ClassStats,
          relearn.step=1,verbose=T,...)
}

\arguments{
  \item{form}{
    A formula specifying the predictive task.
  }
  \item{train}{
    A data frame containing the data set to be used for obtaining the
    first classification model. In case we are using the sliding window
  approach, the size of this training set will determine the size of all
  future  training sets after each slide step.
  }
  \item{test}{
    A data frame containing the data set for which we want predictions.
  }
  \item{type}{
    A character string specifying if we are using a sliding (value
    'slide') or a growing (value 'grow') window workflow. 
  }
  \item{learner}{
    A character string containing the name of classification algorithm
    to use to obtain the predictions (see the Details section for the models currently available).
  }
  \item{eval}{
    A vector of character strings of the metrics that are to be
    calculated using the predictions of the obtained model. The allowed
    metrics are the ones available in function \code{\link{class.eval}}
  (defaults to error rate - "err")
  }
  \item{relearn.step}{
    The number of time steps (translated into number of rows in the test
    set) after which a new model is re-learned (either by sliding or
    growing the training window) (defaults to 1, i.e. each new row).
  }
  \item{verbose}{
    A Boolean indicating whether a "*" character should be printed every
    time the window slides (defaults to TRUE).
  }
  \item{...}{
    Any extra arguments that will be passed to  the selected
    classification algorithm.
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
  functions. The goal of the \code{tsClassWF} function is to facilitate
  this task.

  We have considered two typical workflow approaches for time series
  tasks where the user wants predictions for a certain future time
  period (a test set provided as a data frame in parameter
  \code{test}). Both are based on the assumption that after "some" time
  the model that we have obtained with the given training period data
  (parameter \code{train}) might have become out-dated, and thus a new
  model should be obtained with the most recent data. The idea is that
  as we move in the testing period and get predictions for the successive
  rows of the test set, it is as if the clock was advancing. Previous rows
  for which we already got a prediction are "past" as we assume that the
  successive rows in both the \code{train} and \code{test} data frames
  are ordered by time (they are time series). In this context, as we
  move forward in the test period we can regard the rows for which we
  already got a prediction as past data, and thus potentially useful to be
  added  to our training set with the goal of obtaining a fresh new
  model with more recent data. This type of reasoning only makes sense
  if we suspect that there is some kind of concept drift on our
  data. For stationary data this makes no sense and we would be better
  off using the workflow provided by function
  \code{\link{classWF}}.

  The current function implements two
  workflows following this model-updating strategy: (i) sliding window;
  and (ii) growing window. Both have as user-defined parameter
  (\code{relearn.step}) a number of time periods after which we re-learn
  the model using fresh new data. The difference between them lies on
  how they treat the oldest data (the initial rows of the provided
  training set). Sliding window, as the name suggests, after each
  relearn step slides the training set forward thus forgetting the
  oldest rows of the previous training set whilst incorporating the most
  recent observations. With this approach all models are obtained with a
  training set with the same amount of data (the number of rows of the
  initially given training set). Growing window does not remove older
  rows and thus the training sets keep growing in size.

  Independently of the process used to obtain the predictions for the
  test set, these are based on a prediction model. Through parameter \code{learner} users may indicate the classification
  algorithm to use to obtain this model. The currently available options are:

  "rpartXse": a classification tree available on package \pkg{DMwR}
  based on the functions provided by package \pkg{rpart}.

  "svm": a support vector machine provided by function \code{svm} of
  package \pkg{e1071}.

  "ksvm": another support vector machine provided by function \code{ksvm} of
  package \pkg{kernlab}.

  "lda": a linear discriminant provided by function \code{lda} of
  package \pkg{MASS}.

  "naiveBayes": a naive Bayes provided by function \code{naiveBayes} of
  package \pkg{e1071}.

  "kNN": a k nearest neighbor classifier provided by function \code{kNN} of
  package \pkg{DWwR}, based on function \code{knn} from package
  \pkg{class}.

  "randomForest": a random forest provided by function \code{randomForest} of
  package \pkg{randomForest}.

  "bagging": bagging provided by function \code{bagging} of
  package \pkg{adabag}.

  "boosting": boosting provided by function \code{boosting} of
  package \pkg{adabag}.

  "C5.0": provided by function \code{C5.0} of
  package \pkg{C50}.

  "nnet": provided by function \code{nnet} of
  package \pkg{nnet}.
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
 \code{\link{growClassWF}}, \code{\link{slideClassWF}}, \code{\link{tsClassWF}}, \code{\link{experimentalComparison}}, \code{\link{growRegrWF}}, \code{\link{slideRegrWF}}, \code{\link{classWF}}
}
\examples{

## The following is a small illustrative example using the quotes of the
## SP500 index. This example compares two random forests with 500
## classification trees, one applyed in a standard way, and the other using
## a sliding window with a relearn step of every 5 days. The experiment
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
    slideRF=learner('tsClassWF',pars=list(type='slide',learner='randomForest',
                                            ntree=500,relearn.step=5))),
  mcSettings(10,0.5,0.25))
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
