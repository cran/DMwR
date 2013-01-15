\name{class.eval}
\alias{class.eval}

\title{
Calculate Some Standard Classification Evaluation Statistics
}
\description{
This function is able to calculate a series of classification evaluation
statistics given two vectors: one with the true target variable values,
and the other with the predicted target variable values.
}
\usage{
class.eval(trues, preds,
          stats=if (is.null(benMtrx)) c('err') else c('err','totU'),
          benMtrx=NULL,
          allCls=levels(factor(trues)))
}

\arguments{
  \item{trues}{
A vector or factor with the true values of the target variable.
}
  \item{preds}{
A  vector or factor with the predicted values of the target variable.
}
  \item{stats}{
    A vector with the names of the evaluation statistics to
    calculate. Possible values are "acc", "err"  or
    "totU". This  latter requires that the parameter \code{benMtrx}
    contains a matrix with cost/benefits for all combinations of possible
    predictions and true values, i.e. with dimension NC x NC, where NC is
    the number of classes of the classification task being handled. 
  }
  \item{benMtrx}{
    A matrix with numeric values representing the benefits (positive
    values) and costs (negative values) for all combinations of predicted
    and true values of the nominal target variable of the task. In this
    context, the matrix should have the dimensions NC x NC, where NC is
    the number of possible class values of the classification task. Benefits
    (positive values) should be on the diagonal of the matrix (situations
    where the true and predicted values are equal, i.e. the model
    predicted the correct class and thus should be rewarded for that),
    whilst costs (negative values) should be on all positions outside of
    the diagonal of the matrix (situations where the predicted value is
    different from the true class value and thus the model should incur on
    a cost for this wrong prediction).
  }
  \item{allCls}{
    A vector with the possible values of the nominal target variable,
    i.e. a vector with the classes of the problem. The default of this
    parameter is to infer these values from the given vector of true class
    values. However, if this is a small vector (e.g. you are evaluating
    your model on a small test set), it may happen that not all possible class
    values occur in this vector and this will potentially create problems
    in the sub-sequent calculations. Moreover, even if the vector is not
    small, for highly unbalanced classification tasks, this problem may
    still occur. In these contexts, it is safer to specifically indicate
    the possible class values through this parameter.
  }
}
\details{
  The classification evaluation statistics available through this function
  are "acc", "err" (that is actually the complement of "acc") and
  "totU".

  Both "acc" and "err" are related to the proportion of accurate
  predictions. They are calculated as:
  
  "acc": sum(I(t_i == p_i))/N, where t's are the true values and p's are
  the predictions, while I() is an indicator function given 1 if its
  argument is true and 0 otherwise. Note that "acc" is a value in the interval [0,1], 1
  corresponding to  all predictions being correct.

  "err": = 1 - acc

  Regards "totU" this is a metric that takes into consideration not only
  the fact that the predictions are correct or not, but also the costs or
  benefits of these predictions. As mentioned above it assumes that the
  user provides a fully specified matrix of costs and benefits, with
  benefits corresponding to correct predictions, i.e. where t_i ==
  p_i, while costs correspond to erroneous predictions. These matrices are NC x NC square matrices, where NC is the
  number of possible values of the nominal target variable (i.e. the
  number of classes). The diagonal of these matrices corresponds to the
  correct predictions (t_i == p_i) and should have positive values
  (benefits). The positions outside of the diagonal correspond to
  prediction errors and should have negative values (costs). The "totU"
  measures the total Utility (sum of the costs and benefits) of the
  predictions of a classification model. It is calculated as:

  "totU": sum(CB[t_i,p_i]) where CB is a cost/benefit matrix and CB[t_i,p_i]
  is the entry on this matrix corresponding to predicting class p_i for
  a true value of t_i. 

}
\value{
A named vector with the calculated statistics.
}
\references{ Torgo, L. (2010) \emph{Data Mining using R: learning with case studies},
  CRC Press (ISBN: 9781439810187).

  \url{http://www.dcc.fc.up.pt/~ltorgo/DataMiningWithR}  
}
\author{ Luis Torgo \email{ltorgo@dcc.fc.up.pt} }
\note{
  1. In case you require "totU" to be calculated you must supply a
  cost/benefit matrix through parameter \code{benMtrx}.

  2. If not all possible class values are present in the vector of true
  values  in parameter \code{trues}, you should provide a vector
  with all the possible class values in parameter \code{allCls}.
}
\seealso{
 \code{\link{regr.eval}}
}
\examples{
## Calculating several statistics of a classification tree on the Iris data
data(iris)
idx <- sample(1:nrow(iris),100)
train <- iris[idx,]
test <- iris[-idx,]
tree <- rpartXse(Species ~ .,train)
preds <- predict(tree,test,type='class')
## Calculate the accuracy and error rate
class.eval(test$Species,preds)
## Now trying calculating the utility of the predictions
cbM <- matrix(c(10,-20,-20,-20,20,-10,-20,-10,20),3,3)
class.eval(test$Species,preds,"totU",cbM)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
