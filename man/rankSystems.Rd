\name{rankSystems}
\alias{rankSystems}

\title{
  Provide a ranking of learners involved in an experimental comparison.
}
\description{
  Given a \code{compExp} object resulting from an experimental
  comparison, this function provides a ranking (by default the top 5) of
  the learners involved in the comparison. The rankings are provided by
  data set and for each evaluation metric.
}
\usage{
rankSystems(compRes, top = 5, maxs = rep(F, dim(compRes@foldResults)[2]))
}

\arguments{
  \item{compRes}{
    An object of class \code{compExp} with the results of the
  experimental comparison.
}
  \item{top}{
    The number of learners to include in the rankings (defaulting to 5)
}
  \item{maxs}{
    A vector of booleans with as many elements are there are statistics measured in
    the experimental comparison. A True value means the respective
    statistic is to be maximized, while a False means
    minimization. Defaults to all False values.
}
}
\value{
  The function returns a named list with as many components as there
  are data sets in the comparison. For each data set you will get
  another named list, with as many elements as there evaluation
  statistics. For each of these components you have a data frame with N
  lines, where N is the size of the requested rank. Each line includes
  the name of the learner in the respective rank position and the score
  he got on that particular data set / evaluation metric.
}
\references{ Torgo, L. (2010) \emph{Data Mining using R: learning with case studies},
  CRC Press (ISBN: 9781439810187).

  \url{http://www.dcc.fc.up.pt/~ltorgo/DataMiningWithR}  
}
\author{ Luis Torgo \email{ltorgo@dcc.fc.up.pt} }


\seealso{
\code{\link{experimentalComparison}}, \code{\link{bestScores}}, \code{\link{statScores}}
}
\examples{
## Estimating several evaluation metrics on different variants of a
## regression tree and of a SVM, on  two data sets, using one repetition of 10-fold CV
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
## get the top 3 best performing systems
rankSystems(results,top=2)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }

