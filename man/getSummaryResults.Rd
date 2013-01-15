\name{getSummaryResults}
\alias{getSummaryResults}

\title{
  Obtain a set of descriptive statistics of the results of a learner
}
\description{
  This function provides a set of descriptive statistics for each
  evaluation metric that is estimated on an experimental
  comparison. These statistics are obtained for a particular learner,
  and for one of the prediction problems involved in the experimental
  comparison. 
}
\usage{
getSummaryResults(results,learner,dataSet)
}

\arguments{
  \item{results}{
    This is a \code{compExp} object (type "class?compExp" for details)
    that contains the results of an experimental comparison obtained
    through the \code{experimentalComparison()} function. 
}
\item{learner}{
  This is the string that identifies the learner.
}
\item{dataSet}{
  The string that identifies the data set for which you want to get the scores.
}
}
\value{
  The function returns a matrix with the rows representing summary
  statistics of the scores obtained by the model on the different
  iterations, and the columns representing the evaluation statistics
  estimated in the experiment.
}
\references{ Torgo, L. (2010) \emph{Data Mining using R: learning with case studies},
  CRC Press (ISBN: 9781439810187).

  \url{http://www.dcc.fc.up.pt/~ltorgo/DataMiningWithR}  
}
\seealso{
\code{\link{getFoldsResults}}, \code{\link{experimentalComparison}}
}
\examples{
## Estimating several evaluation metrics on different variants of a
## regression tree on  a data set, using one repetition of 10-fold CV
data(swiss)

## First the user defined functions 
cv.rpartXse <- function(form, train, test, ...) {
    require(DMwR)
    t <- rpartXse(form, train, ...)
    p <- predict(t, test)
    mse <- mean((p - resp(form, test))^2)
    c(nmse = mse/mean((mean(resp(form, train)) - resp(form, test))^2), 
        mse = mse)
}

results <- experimentalComparison(
               c(dataset(Infant.Mortality ~ ., swiss)),
               c(variants('cv.rpartXse',se=c(0,0.5,1))),
               cvSettings(1,10,1234)
                                 )

## Get the statistics of a specific learner
getSummaryResults(results,'cv.rpartXse.v1','swiss')

## Get the statistics of the learner that obtained the best NMSE on the
## swiss data set
getSummaryResults(results,bestScores(results)$swiss['nmse','system'],'swiss')

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
