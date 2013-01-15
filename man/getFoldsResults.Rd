\name{getFoldsResults}
\alias{getFoldsResults}

\title{
  Obtain the results on each iteration of a learner
}
\description{
  This function allows you to obtain the scores obtained by a learner on
  the different iterations that form an experimental comparison. These
  scores are obtained for a particular data set of this comparison.
}
\usage{
getFoldsResults(results,learner,dataSet)
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
  The result of the function is a matrix with as many columns as there
  are evaluation statistics in the experimental comparison, and with as
  many rows as there are iterations in this experiment. The values on
  this matrix are the scores of the learner for respective statistic on
  the different iterations of the process.
}
\references{ Torgo, L. (2010) \emph{Data Mining using R: learning with case studies},
  CRC Press (ISBN: 9781439810187).

  \url{http://www.dcc.fc.up.pt/~ltorgo/DataMiningWithR}  
}
\seealso{
\code{\link{getSummaryResults}}, \code{\link{experimentalComparison}}
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

## Get the scores of a specific learner
getFoldsResults(results,'cv.rpartXse.v1','swiss')

## Get the scores of the learner that obtained the best NMSE on the
## swiss data set
getFoldsResults(results,bestScores(results)$swiss['nmse','system'],'swiss')

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
