\name{classWF}
\alias{classWF}

\title{
  A function implementing a standard workflow for classification tasks
}
\description{
  This function implements a standard workflow for a classification
  task. The workflow consists of: (i) learning a classification model based on the given
  training set, (ii) using it to make predictions for the provided test set,
  and finally  (iii) measuring some standard classification metrics of its performance.
}
\usage{
classWF(form,train,test,learner,eval=.ClassStats,...)
}

\arguments{
  \item{form}{
    A formula specifying the predictive task.
  }
  \item{train}{
    A data frame containing the data set to be used for obtaining the
    classification model (the training set).
  }
  \item{test}{
    A data frame containing the data set to be used for testing the
    obtained classification model (the test set).
  }
  \item{learner}{
    A character string containing the name of classification algorithm
    to use to obtain the classification model with the training set (see
    the Details section for the models currently available).
  }
  \item{eval}{
    A vector of character strings of the metrics that are to be
    calculated using the predictions of the obtained model. The allowed
    metrics are the ones available in function \code{\link{class.eval}}
  (defaults to "err" - error rate). 
  }
  \item{...}{
    Any extra arguments that will be passed to either the selected
    classification algorithm, or to the \code{\link{class.eval}} function
    if they are any of the arguments accepted by this function (e.g. a
    cost/benefit matrix passed through argument \code{benMtrx})
  }
}
\details{
  The main goal of this function is to facilitate the task of the users
  of the experimental comparison infra-structure provided by function
  \code{\link{experimentalComparison}}. This latter function requires
  the user to write down a function implementing each of the workflows
  to be evaluated/compared by the infra-structure. Frequently, users
  just want to compare existing algorithms or variants of these algorithms on a
  set of predictive tasks, using some standard classification error
  metrics. In these situations, it may be tedious to have to write these
  functions. The goal of the \code{classWF} function is to facilitate
  this task.

  Through parameter \code{learner} users may indicate the classification
  algorithm to use in the workflow. The currently available options are:

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
 \code{\link{experimentalComparison}}, \code{\link{regrWF}}, \code{\link{tsClassWF}}, \code{\link{tsRegrWF}}, \code{\link{growClassWF}}, \code{\link{slideClassWF}},  \code{\link{growRegrWF}}, \code{\link{slideRegrWF}}
}
\examples{
## Estimating the error rate on the Iris data set of three variants
## (different pruning levels) of a classification tree through 10-fold
## cross validation  
data(iris)
res <- experimentalComparison(
         c(dataset(Species ~ .,iris)),
         variants('classWF',learner='rpartXse',se=c(0,0.5,1)),
         cvSettings(1,10,123))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
