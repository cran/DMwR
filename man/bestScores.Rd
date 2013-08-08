\name{bestScores}
\alias{bestScores}

\title{
Obtain the best scores from an experimental comparison
}
\description{
  This function can be used to obtain the learning systems that obtained
  the best scores on an experimental comparison. This information will
  be shown for each of the evaluation statistics involved in the
  comparison and also for all data sets that were used.
}
\usage{
bestScores(compRes, maxs = rep(F, dim(compRes@foldResults)[2]))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{compRes}{
    A \code{compExp} object with the results of your experimental comparison.
}
  \item{maxs}{
    A vector of booleans with as many elements are there are statistics measured in
    the experimental comparison. A True value means the respective
    statistic is to be maximized, while a False means
    minimization. Defaults to all False values.
}
}
\details{
  This is a handy function to check what were the best performers in a
  comparative experiment for each data set and each evaluation
  metric. The notion of "best performance" depends on the type of
  evaluation metric, thus the need of the second parameter. Some
  evaluation statistics are to be maximized (e.g. accuracy), while
  others are to be minimized (e.g. mean squared error). If you have a
  mix of these types on your experiment then you can use the \code{maxs}
  parameter to inform the function of which are to be maximized (minimized).
}
\value{
  The function returns a list with named components. The components
  correspond to the data sets used in the experimental comparison. For
  each component you get a data.frame, where the rows represent the
  statistics. For each statistic you get the name of the best performer
  (1st column of the data frame) and the respective score on that
  statistic (2nd column).
}
\references{ Torgo, L. (2010) \emph{Data Mining using R: learning with case studies},
  CRC Press (ISBN: 9781439810187).

  \url{http://www.dcc.fc.up.pt/~ltorgo/DataMiningWithR}  
}
\author{ Luis Torgo \email{ltorgo@dcc.fc.up.pt} }

\seealso{
\code{\link{experimentalComparison}}, \code{\link{rankSystems}}, \code{\link{statScores}}
}
\examples{
## Estimating several evaluation metrics on different variants of a
## regression tree and of a SVM, on  two data sets, using one repetition
## of  10-fold CV
data(swiss)
data(mtcars)

## First the user defined functions 
cv.rpartXse <- function(form, train, test, ...) {
    require(DMwR)
    t <- rpartXse(form, train, ...)
    p <- predict(t, test)
    mse <- mean((p - resp(form, test))^2)
    c(nmse = mse/mean((mean(resp(form, train)) - resp(form, test))^2), 
        mse = mse)
}

## run the experimental comparison
results <- experimentalComparison(
               c(dataset(Infant.Mortality ~ ., swiss),
                 dataset(mpg ~ ., mtcars)),
               c(variants('cv.rpartXse',se=c(0,0.5,1))),
               cvSettings(1,10,1234)
                                 )
## get the best scores for dataset and statistic
bestScores(results)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }

